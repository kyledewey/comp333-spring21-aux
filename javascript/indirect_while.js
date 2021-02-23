while (x < 10) {
    x++;
}

function indirectWhile(funcOne, funcTwo)
{
    if (funcOne())
    {
        funcTwo();
        indirectWhile(funcOne, funcTwo);

        indirectWhile(funcOne(), funcTwo()); // NOT doing this
    }
}

