using Microsoft.AspNetCore.Mvc.Testing;

namespace app.spec;

public class IntegrationTest
{
    [Fact]
    public async Task TestHelloWorldEndpoint()
    {
        // Arrange
        await using var application = new WebApplicationFactory<Program>();
        using var client = application.CreateClient();

        // Act
        var response = await client.GetAsync("/");

        // Assert
        response.EnsureSuccessStatusCode();
        var responseContent = await response.Content.ReadAsStringAsync();
        responseContent.Should().Be("Hello World!");
    }
}