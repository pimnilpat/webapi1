using api1.Controllers;
using NUnit.Framework;

namespace NUnitTestProject1
{
    public class Tests
    {       
        private WeatherForecastController controller;

        [SetUp]
        public void Setup()
        {
            controller = new WeatherForecastController();
        }

        [Test]
        public void Test1()
        {
            var result = controller.Get();

            Assert.IsNotNull(result);
        }
    }
}