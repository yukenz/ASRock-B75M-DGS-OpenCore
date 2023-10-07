/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-XOSI.aml, Sat Oct  7 12:03:56 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000F5 (245)
 *     Revision         0x02
 *     Checksum         0x13
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "XOSI"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "XOSI", 0x00001000)
{
    Method (XOSI, 1, NotSerialized)
    {
        Store (Package (0x0A)
            {
                "Windows 2000", 
                "Windows 2001", 
                "Windows 2001 SP1", 
                "Windows 2001.1", 
                "Windows 2001 SP2", 
                "Windows 2001.1 SP1", 
                "Windows 2006", 
                "Windows 2006 SP1", 
                "Windows 2006.1", 
                "Windows 2009"
            }, Local0)
        If (_OSI ("Darwin"))
        {
            Return (LNotEqual (Ones, Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}

