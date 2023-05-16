using Microsoft.AspNetCore.Mvc.Testing;

namespace app.spec;

public class UnitTest
{
    [Fact]
    public void CanCreateApplication()
    {
        new Application()
            .Should()
            .NotBeNull();
    }
}