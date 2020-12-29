Test date: 2021 Feb 21



## pays out
[link to test...](http://github.com/trufflesuite/txlog-seedlings/blob/4af7c9e1104b5a1147ba37abd1c5713b86598a3a/test/insurance.js#L22)

##### d1, tx: 0x7962898b9cecbbbc9039f71b28e121fe44c01e0feda96b1c84e1f6bf02459b3d

[SVG :telescope:](https://www.planttext.com/api/plantuml/svg/hPHTRvim58Rl_IkiTXURkcus1eEZBXeXiFQgbLPf5-iq6N-agCI9-DYIDlllEo4iIj8gKgLnmS77BmzlpZaEGf_hHbPDEoqHacqpS-qqDnMg7metbvMSuj9CZDCZgHucrQnrEfcLimgVPccM9Yb25tMpBCqGuUwwDrAR2Z_rIumlPrNnE7EDBEEocBYfSGqGRRCLPB2vGSxRQbwQlOslnQF1rD_cRgJMXPjWIlhKdovUVEnDeFxxLwuk9lTDZVCblgrQQu6Bcg8f3RvTE7mfw_i19ejGS2yIKIwKKNcUAq6Oi27DlSXGZrhZ-ufGGwpHKl2SgiWtrFBS4iyFHCuqWfAf1godrp6MDJw1U8AWR4sXYhc4dmf6saewPNuIsYbs4_lIaN76ma9Mot_Y_TGHkVTSxXsHi-ToTe9GPn-V3mzSuhEp0PxBvQnjtjwvEtJHz_vz7uUhJxXPpWs6wEIqYxzasSB3Mhx2RG46LjZ2yDGGkU1Yi_KEFs7oWU0ltz8hQEN1Py-_dqugOzoFjQE3Kk01VhDvUNrrnDT2lFy1OQ-0375VuFC1HcXphD3DJe-qQMHHrZi57fCnGDS5XjC3FOE718v51LEtBNMiTMLgsDk-Drnr0mdtHMCg9yjoYQz_EwDnh1GSuNKpo89AxId9oPXhEWe27e-9CZnYN1gV6yvz4mLX7j1zyDv0xomxP98OvdCLYTGFUPHOeZHBx8YbWSz9oiXOwd0KCtyVUJ3uUuaEcta2t924Knlvoa-fbcDc2Oa9bs0t23tYAPRo8rZl1QnAh8Wb5n4H2P6vPPa8Gie2AfWEFSlyXEK18yUmx0Lin28UM9xPm1-590EN0VDPHc7bUIaLYiSXqt40M1Y0VWpGPxZ3V_1V)


```plantuml


@startuml

autonumber
skinparam legendBackgroundColor #FEFECE

<style>
      header {
        HorizontalAlignment left
        FontColor purple
        FontSize 14
        Padding 10
      }
    </style>

header Insights by Truffle

title Txn Hash: 0x7962898b9cecbbbc9039f71b28e121fe44c01e0feda96b1c84e1f6bf02459b3d


actor EOA as "EOA"
participant Insurance_01 as "Insurance_01"
participant Beneficiary_01 as "Beneficiary_01"
participant Beneficiary_02 as "Beneficiary_02"
participant Beneficiary_03 as "Beneficiary_03"

"EOA" -> "Insurance_01" ++: payout(\n\
<#FEFECE,#FEFECE>|= type |= name |= value |\n\
| uint | funds | 6969 |\n\
) { 0.0 GWEI }
"Insurance_01" -[#green]-> "Beneficiary_01" : $ { 0.000006969 GWEI }
"Insurance_01" -[#green]-> "Beneficiary_02" : $ { 0.000006969 GWEI }
"Insurance_01" -[#green]-> "Beneficiary_03" : $ { 0.000006969 GWEI }
"Insurance_01" -> "EOA" --: 

legend
Participant details
<#FEFECE,#D0D000>|= Alias |= Contract name |= Address |
<#FEFECE>| EOA | Externally Owned Account | 0x1ad2ca60D6d1B556AD0ce6836ae46e664e857b51 |
<#FEFECE>| Insurance_01 | Insurance | 0xCCe346c89E4768Cf0cd3CfB3E5460E30Dad7BA34 |
<#FEFECE>| Beneficiary_01 | Beneficiary | 0xF2964e0C61f84c4E1daD3f00A06a36a57202c3E6 |
<#FEFECE>| Beneficiary_02 | Beneficiary | 0xcCf9Aa69809C0abf3F957135193d72f34C3b5306 |
<#FEFECE>| Beneficiary_03 | Beneficiary | 0x83865f6Ff54B70F0A05343F14B722E19c6A73dA5 |
endlegend

@enduml
```

