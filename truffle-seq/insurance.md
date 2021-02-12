Test date: 2021 Feb 12



## pays out
[link to test...](http://github.com/trufflesuite/txlog-seedlings/blob/152a410baf2d76d60511fdf559e3219e7a4ffee9/test/insurance.js#L20)

##### d1, tx: 0xf42b6cdfff0c2d0ac674097f76aec3e0d8cf5e39287af6c2e57a8965efc51fd3

[SVG :telescope:](https://www.planttext.com/api/plantuml/svg/nPLTJzim58Rl_IiikDd4sFmHEt75EjAq7LmDQKYx61Do7Bj4f4daE5CBvR_FJQDIc42Tfccvw6bY-pclJuxV073QE6bTEoy0aAshodQUQWkQsxoifPLpMEYPBhEHLBSpMxLbbbH5PU7XT3AT91C0JXgtBFGGmEwwqJBJ5jxtjn2ULJQ_gqedYxZ8P-LSbyuJZTjEcFh13R9kRLte9mDVypiDSR1zTY6pB2zd4AF-qKCNJpxq8a2V_xniyjcDQs2wX9UsDSPpWSjTeU7beeHdihaPGBGm0KcvoemnI94CISN308dGX5ngHJNA8cMOfe94eJHS4Sr26GdEj54Ccum2NpBblFJ9bnZA1XxuU020hvlBLLvBlrUlfBMoLBeRHmjj21OZBk9KAA43oL6K4ZKbKo9n72E5HKQZY8u6suNFW2DTQkDlf5tso02dgT22HnG7JFeV6YcEKQoJW5Cn5Z8OfmacoM1dwSlGQz9Z6HOi2d0mJbXaE1r596MHJ30I6U52Kspu1Fd2xOcbFHPbd0Hi6g5KZ6DAiY2ICXGf9x4lDsLPC5B1s7EVORlImkCXF7Wi33mw6i1QBglMlRaghy19tvJl-ZXSVOHkMMleOoddNVmfYzR_MKzVmJOl7M4Shg3nZTtuo112cz6tyFubPcshMbkttF9wNC-6w3s2dxzDpZUW1oz-H_FnzyEPrRhyiTxBxXxXuAyohY_svscloVzAJFzruY7ic-Pu0Fr91HiZ0nSx3Pff9_EYsL4mHcEFNIj8lFzOVxothUEzn-gcwHHfcvjSPt2rNJfSTIxWbIruECKYGFvSCeGPGMaII9Ce5J53Q3W94S4XzQtk9tzwIdXqYpLdNw_udRDh4clIlXRnAiaxmvgrho-ypg8TQrypw5d-zVKl4O1J7_n7wnS0)


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

title Txn Hash: 0xf42b6cdfff0c2d0ac674097f76aec3e0d8cf5e39287af6c2e57a8965efc51fd3


actor EOA as "EOA"

participant Insurance as "0xef219B69Ab9c9e4a608b2cF2F2a1AA0c19d3883B:Insurance"

participant Beneficiary as "0x41bb9e9683145a31438c610AeC4639D9a4DbC12C:Beneficiary"

participant Beneficiary_2 as "0x51958414DC58f63B82b58aC109d269e31f6E0f0c:Beneficiary"

participant Beneficiary_3 as "0x0d6245F80b9DA32d48aa79b62A0d835d4Bc4D0f0:Beneficiary"

"EOA" -> "Insurance" ++: payout(\n\
<#FEFECE,#FEFECE>|= type |= name |= value |\n\
| uint256 | funds | 5000 |\n\
) {\n\
<#FEFECE,#FEFECE>|= property |= value|\n\
| value | 0.0 GWEI |\n\
}

"Insurance" -[#green]-> "Beneficiary" : {\n\
<#FEFECE,#FEFECE>|= property |= value|\n\
| value | 0.000005 GWEI |\n\
}

"Insurance" -[#green]-> "Beneficiary_2" : {\n\
<#FEFECE,#FEFECE>|= property |= value|\n\
| value | 0.000005 GWEI |\n\
}

"Insurance" -[#green]-> "Beneficiary_3" : {\n\
<#FEFECE,#FEFECE>|= property |= value|\n\
| value | 0.000005 GWEI |\n\
}

"Insurance" -> "EOA" --: 



legend
Participant details
<#FEFECE,#D0D000>|= Contract name |= address |= verified |
<#FEFECE>| EOA | 0x67F194041b501520bC4afCcc85f237E70217335d | ? |
<#FEFECE>| Insurance | 0xef219B69Ab9c9e4a608b2cF2F2a1AA0c19d3883B | ? |
<#FEFECE>| Beneficiary | 0x41bb9e9683145a31438c610AeC4639D9a4DbC12C | ? |
<#FEFECE>| Beneficiary_2 | 0x51958414DC58f63B82b58aC109d269e31f6E0f0c | ? |
<#FEFECE>| Beneficiary_3 | 0x0d6245F80b9DA32d48aa79b62A0d835d4Bc4D0f0 | ? |
endlegend


@enduml
```

