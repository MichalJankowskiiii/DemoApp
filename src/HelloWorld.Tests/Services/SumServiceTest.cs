namespace HelloWorld.Tests.Services
{
    using HelloWorld.Services;
    using Xunit;

    public class SumServiceTest
    {
        [Fact]
        public void Given1and2_WhenRunSum_ThenSumEqual3()
        {
            // Arrange
            SumService service = new SumService();

            // Act
            int result = service.Sum(1, 2);

            // Assert
            Assert.Equal(3, result);
        }
    }
}
