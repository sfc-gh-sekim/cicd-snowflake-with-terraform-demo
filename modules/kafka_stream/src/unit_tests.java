@Test
public void testRunMethod() {
    Session session = mock(Session.class);
    String mystage = "mystage";
    String prefix = "prefix";
    int numlines = 5;
    StreamDemo streamDemo = new StreamDemo();
    String result = streamDemo.run(session, mystage, prefix, numlines);
    assertEquals("UPLOADED", result);
}

@Test
public void testSampleData() {
    StreamDemo.SampleData sampleData = new StreamDemo.SampleData();
    String dataLine = sampleData.getDataLine(1);
    assertNotNull(dataLine);
}
