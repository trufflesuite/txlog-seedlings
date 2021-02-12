Test date: 2021 Feb 12



## pays out
[link to test...](http://github.com/trufflesuite/txlog-seedlings/blob/0e1d57622e2550f3c79e053fbe2365c8768e8cda/test/insurance.js#L20)

##### d1, tx: 0xb1edd805ffe21cb2e6707e497afd7d64550845c9cfbfeaea7c3e7e5299f7ef82

[SVG :telescope:](https://www.planttext.com/api/plantuml/svg/nPNVRvim4CVV_LTOxSkchfin-0TLbpL0MFkqIgkqXtMgZ3bIL0AHCLFJfl_x345PkgsRgcaQByVPn-U-jkyCGYUjLSPsYmeXrTccxXOP6DJUbFLI6RN05SoXpYEbR-QcwUeyRgh6uFrqbixY6KB7hLrLC45uUAv1vM3m_UXYVDgOygwfhQgcLJcl5r1RHopiDY1ranlaiZFB2XvDV2pl07l1TknSvNbPpx57ng67mHw_6KMWCVzPtPRpQzlYR8KlJ5SKZejiQIl05xSrFbNjzH4cjva7UIu9AmgWdiueS4441A5GHIvo7Z16PC1qg8ki00LAQ1y4C1g6XO12KkIsJ5idVVPXYbMBzvpTGyZjcorrkLHkhKv9PrIjOPZVUZz4HL13uHnbLaFSZlzqv1LzHgp_YzX1BZwSxEh21mT7UAbMJMTVNDQNw7Wyw5UZdQpVOhjQ0dQsLel1VbLLvrxwy3NkojfInl4Q5wvOMcSP8MGp-nBVFyLSccO9ngwsl14tiZ5vJV3xJxEp3UZ1YT_HVFXvVsu0wY_zMdRNY8_-AcF_iEUdlQB_Ax7_hnDFy5WqXqVOLJ_QN0xeVAVgSh2ghDeT1Gb97BPN4BkUDgvbjgNZ-jb0smwAm9H52JbURp-Th8VESifkWVYACjUbd2OSH220I0XPHgSIeZ2GHSAzn8F41RzxJFZUWJqdIgGA1Sq3ncDVwe8mAdMGCfPc0OEG2EB77YFfpvpT7kr9b5CLSK-em1DQSaqJTrTCLJXDVO_pgHzANoT9N_g_8RaUxbcP7r8MQHbbF9_w98YoNEQ9oAIGJ6SaZndZcl-9vGyivMwiM76F1yAdKWPKw5XG6d0k_22W7YTX5gKn7Ldk-CP3HEZ46VSZ-0O0)


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

title Txn Hash: 0xb1edd805ffe21cb2e6707e497afd7d64550845c9cfbfeaea7c3e7e5299f7ef82


actor EOA as "EOA"

participant Insurance as "Insurance"

participant Beneficiary as "Beneficiary"

participant Beneficiary_2 as "Beneficiary"

participant Beneficiary_3 as "Beneficiary"

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
<#FEFECE>| EOA | 0xe03a2521c62D6e747e08e95b2A8eB948fD61D1eD | ? |
<#FEFECE>| Insurance | 0xBD8a972d456C38cf0528c4F55Fb45e90703C150F | ? |
<#FEFECE>| Beneficiary | 0x262aB617a417c86c2D845Aa9AF3166A3983cDD00 | ? |
<#FEFECE>| Beneficiary_2 | 0xb3925Bc8Bb6dA304Bbd8dD7b8785cb0dC556c600 | ? |
<#FEFECE>| Beneficiary_3 | 0xa45cCa616473288427cC722466734421609bBFC2 | ? |
endlegend


@enduml
```

