state("PigeonSimulator-WinGDK-Shipping")
{
    int mapNumber: "PigeonSimulator-WinGDK-Shipping.exe", 0x08F445E0, 0x1B0, 0x340, 0x2C8, 0xEC;
}

init
{
    vars.splitCooldown = 0;
}

update
{
    if (vars.splitCooldown > 0)
    {
        vars.splitCooldown--;
    }
}

start
{
    if (current.mapNumber == 1)
    {
        vars.splitCooldown = 0;
        return true;
    }
}

split
{
    if (vars.splitCooldown > 0)
        return false;

    if (current.mapNumber > old.mapNumber)
    {
        vars.splitCooldown = 30;
        return true;
    }
}

reset
{
    if (current.mapNumber == 27849099)
    {
        return true;
    }
}
