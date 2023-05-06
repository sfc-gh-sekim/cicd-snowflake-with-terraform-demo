import com.snowflake.snowpark_java.Session;
import java.io.*;
import java.util.HashMap;
public class StreamDemo {
    public String run(Session session, String mystage,String prefix,int numlines) {
        SampleData SD=new SampleData();
        BufferedWriter bw = null;
        File f=null;
        try {
            f = File.createTempFile(prefix, ".json");
            FileWriter fw = new FileWriter(f);
            bw = new BufferedWriter(fw);
            boolean first=true;
            bw.write("[");
            for(int i=1;i<=numlines;i++){
                if (first) first = false;
                else {bw.write(",");bw.newLine();}
                bw.write(SD.getDataLine(i));
            }
            bw.write("]");
            bw.close();
            return session.file().put(f.getAbsolutePath(),mystage,options)[0].getStatus();
        }
        catch (Exception ex){
            return ex.getMessage();
        }
        finally {
            try{
                if(bw!=null) bw.close();
                if(f!=null && f.exists()) f.delete();
            }
            catch(Exception ex){
                return ("Error in closing:  "+ex);
            }
        }
    }

    private static final HashMap<String,String> options = new HashMap<String, String>() {
        { put("AUTO_COMPRESS", "TRUE"); }
    };

    // sample data generator (credit card transactions)
    public static class SampleData {
        private static final java.util.Random R=new java.util.Random();
        private static final java.text.NumberFormat NF_AMT = java.text.NumberFormat.getInstance();
        String[] transactionType={"PURCHASE","PURCHASE","PURCHASE","PURCHASE","PURCHASE","PURCHASE","PURCHASE","PURCHASE","PURCHASE","PURCHASE","REFUND"};
        String[] approved={"true","true","true","true","true","true","true","true","true","true","false"};
        static {
            NF_AMT.setMinimumFractionDigits(2);
            NF_AMT.setMaximumFractionDigits(2);
            NF_AMT.setGroupingUsed(false);
        }

        private static int randomQty(int low, int high){
            return R.nextInt(high-low) + low;
        }

        private static double randomAmount(int low, int high){
            return R.nextDouble()*(high-low) + low;
        }

        private String getDataLine(int rownum){
            StringBuilder sb = new StringBuilder()
                .append("{")
                .append("\"element\":"+rownum+",")
                .append("\"object\":\"basic-card\",")
                .append("\"transaction\":{")
                .append("\"id\":"+(1000000000 + R.nextInt(900000000))+",")
                .append("\"type\":"+"\""+transactionType[R.nextInt(transactionType.length)]+"\",")
                .append("\"amount\":"+NF_AMT.format(randomAmount(1,5000)) +",")
                .append("\"currency\":"+"\"USD\",")
                .append("\"timestamp\":\""+java.time.Instant.now()+"\",")
                .append("\"approved\":"+approved[R.nextInt(approved.length)]+"")
                .append("},")
                .append("\"card\":{")
                    .append("\"number\":"+ java.lang.Math.abs(R.nextLong()) +"")
                .append("},")
                .append("\"merchant\":{")
                .append("\"id\":"+(100000000 + R.nextInt(90000000))+"")
                .append("}")
                .append("}");
            return sb.toString();
        }
    }
}
