# ExampleDatasets

Swift package for (obtaining) example datasets.

Currently, this repository contains only 
[datasets metadata](./resources/dfRdatasets.csv). The datasets are downloaded from
the repository
[Rdatasets](https://github.com/vincentarelbundock/Rdatasets/), \[VAB1\].

This package follows the design of the [Raku](https://raku.org) and Python packages
with the same name; see \[AAr1, AAp1\].

------------------------------------------------------------------------

## Usage examples

Here is an example (playground) code:

```swift
//See number of available datasets
print(ExampleDatasets.dfRdatasets.shape.rows)
// 1745


//See the head 5 rows of the datasets metadata dataset
print(ExampleDatasets.dfRdatasets.prefix(5))

// ┏━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━┳━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳╍╍╍╍╍╍┓
// ┃   ┃ Package  ┃ Item          ┃ Title                                              ┃ Rows  ┃ Cols  ┃ n_binary ┃ n_character ┃ n_factor ┃ n_logical ┃ n_numeric ┃ 2    ┇
// ┃   ┃ <String> ┃ <String>      ┃ <String>                                           ┃ <Int> ┃ <Int> ┃ <Int>    ┃ <Int>       ┃ <Int>    ┃ <Int>     ┃ <Int>     ┃ more ┇
// ┡━━━╇━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━╇━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━╇╍╍╍╍╍╍┩
// │ 0 │ AER      │ Affairs       │ Fair's Extramarital Affairs Data                   │   601 │     9 │        2 │           0 │        2 │         0 │         7 │      ┆
// │ 1 │ AER      │ ArgentinaCPI  │ Consumer Price Index in Argentina                  │    80 │     2 │        0 │           0 │        0 │         0 │         2 │      ┆
// │ 2 │ AER      │ BankWages     │ Bank Wages                                         │   474 │     4 │        2 │           0 │        3 │         0 │         1 │      ┆
// │ 3 │ AER      │ BenderlyZwick │ Benderly and Zwick Data: Inflation, Growth and St… │    31 │     5 │        0 │           0 │        0 │         0 │         5 │      ┆
// │ 4 │ AER      │ BondYield     │ Bond Yield Data                                    │    60 │     2 │        0 │           0 │        0 │         0 │         2 │      ┆
// └───┴──────────┴───────────────┴────────────────────────────────────────────────────┴───────┴───────┴──────────┴─────────────┴──────────┴───────────┴───────────┴╌╌╌╌╌╌┘
// 5 rows, 12 columns


//Show summary of the datasets metadata dataset
print(ExampleDatasets.dfRdatasets.summary())

// ┏━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┓
// ┃    ┃ column      ┃ mean         ┃ std           ┃ min      ┃ max         ┃ median   ┃ Q1       ┃ Q3       ┃ mode                                               ┃ uniqueCount ┃ noneCount ┃ someCount ┃
// ┃    ┃ <String>    ┃ <Double>     ┃ <Double>      ┃ <Double> ┃ <Double>    ┃ <Double> ┃ <Double> ┃ <Double> ┃ <Array<Any>>                                       ┃ <Int>       ┃ <Int>     ┃ <Int>     ┃
// ┡━━━━╇━━━━━━━━━━━━━╇━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━┩
// │ 0  │ Package     │          nil │           nil │      nil │         nil │      nil │      nil │      nil │ ["Stat2Data"]                                      │          57 │         0 │     1,745 │
// │ 1  │ Item        │          nil │           nil │      nil │         nil │      nil │      nil │      nil │ ["Mroz", "housing", "smoking", "Grunfeld", "salin… │       1,688 │         0 │     1,745 │
// │ 2  │ Title       │          nil │           nil │      nil │         nil │      nil │      nil │      nil │ ["Internal functions for gap"]                     │       1,605 │         0 │     1,745 │
// │ 3  │ Rows        │ 3,860.679656 │ 39,616.711947 │      2.0 │ 1,414,593.0 │    108.0 │     35.0 │    601.0 │ [20]                                               │         699 │         0 │     1,745 │
// │ 4  │ Cols        │    13.021203 │    170.436088 │      1.0 │     6,831.0 │      5.0 │      3.0 │      9.0 │ [2]                                                │          56 │         0 │     1,745 │
// │ 5  │ n_binary    │     1.940401 │     17.266825 │      0.0 │       624.0 │      0.0 │      0.0 │      2.0 │ [0]                                                │          28 │         0 │     1,745 │
// │ 6  │ n_character │     0.311175 │      1.276111 │      0.0 │        17.0 │      0.0 │      0.0 │      0.0 │ [0]                                                │          14 │         0 │     1,745 │
// │ 7  │ n_factor    │     1.290544 │      3.207618 │      0.0 │        64.0 │      0.0 │      0.0 │      2.0 │ [0]                                                │          22 │         0 │     1,745 │
// │ 8  │ n_logical   │     0.030372 │      0.401681 │      0.0 │        11.0 │      0.0 │      0.0 │      0.0 │ [0]                                                │           7 │         0 │     1,745 │
// │ 9  │ n_numeric   │    11.338109 │    170.376143 │      0.0 │     6,830.0 │      3.0 │      2.0 │      7.0 │ [2]                                                │          51 │         0 │     1,745 │
// │ 10 │ CSV         │          nil │           nil │      nil │         nil │      nil │      nil │      nil │ ["https://vincentarelbundock.github.io/Rdatasets/… │       1,745 │         0 │     1,745 │
// │ 11 │ Doc         │          nil │           nil │      nil │         nil │      nil │      nil │      nil │ ["https://vincentarelbundock.github.io/Rdatasets/… │       1,745 │         0 │     1,745 │
// └────┴─────────────┴──────────────┴───────────────┴──────────┴─────────────┴──────────┴──────────┴──────────┴────────────────────────────────────────────────────┴─────────────┴───────────┴───────────┘
// 12 rows, 12 columns


//Obtaining multiple results for a spec
ExampleDatasets.retrieveDataset(itemSpec: "titanic")

// Found more than one dataset with the given spec:
// ┏━━━━━┳━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━┳━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳╍╍╍╍╍╍┓
// ┃     ┃ Package    ┃ Item     ┃ Title                                ┃ Rows  ┃ Cols  ┃ n_binary ┃ n_character ┃ n_factor ┃ n_logical ┃ n_numeric ┃ 2    ┇
// ┃     ┃ <String>   ┃ <String> ┃ <String>                             ┃ <Int> ┃ <Int> ┃ <Int>    ┃ <Int>       ┃ <Int>    ┃ <Int>     ┃ <Int>     ┃ more ┇
// ┡━━━━━╇━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━╇━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━╇╍╍╍╍╍╍┩
// │ 256 │ causaldata │ titanic  │ Data from the sinking of the Titanic │ 2,201 │     4 │        3 │           0 │        0 │         0 │         4 │      ┆
// │ 288 │ COUNT      │ titanic  │ titanic                              │ 1,316 │     4 │        3 │           0 │        4 │         0 │         0 │      ┆
// └─────┴────────────┴──────────┴──────────────────────────────────────┴───────┴───────┴──────────┴─────────────┴──────────┴───────────┴───────────┴╌╌╌╌╌╌┘
// 2 rows, 12 columns


//Retrieve a dataset by full spec
let dsRes : DataFrame? = ExampleDatasets.retrieveDataset(itemSpec: "titanic", packageSpec: "COUNT")

if dsRes == nil {
    print("please retry...")
} else {
    print(dsRes!)
}

// ┏━━━━┳━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┓
// ┃    ┃          ┃ class     ┃ age      ┃ sex      ┃ survived ┃
// ┃    ┃ <String> ┃ <String>  ┃ <String> ┃ <String> ┃ <String> ┃
// ┡━━━━╇━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━╇━━━━━━━━━━┩
// │ 0  │ 1        │ 1st class │ adults   │ man      │ yes      │
// │ 1  │ 2        │ 1st class │ adults   │ man      │ yes      │
// │ 2  │ 3        │ 1st class │ adults   │ man      │ yes      │
// │ 3  │ 4        │ 1st class │ adults   │ man      │ yes      │
// │ 4  │ 5        │ 1st class │ adults   │ man      │ yes      │
// │ 5  │ 6        │ 1st class │ adults   │ man      │ yes      │
// │ 6  │ 7        │ 1st class │ adults   │ man      │ yes      │
// │ 7  │ 8        │ 1st class │ adults   │ man      │ yes      │
// │ 8  │ 9        │ 1st class │ adults   │ man      │ yes      │
// │ 9  │ 10       │ 1st class │ adults   │ man      │ yes      │
// │ 10 │ 11       │ 1st class │ adults   │ man      │ yes      │
// │ 11 │ 12       │ 1st class │ adults   │ man      │ yes      │
// │ 12 │ 13       │ 1st class │ adults   │ man      │ yes      │
// │ 13 │ 14       │ 1st class │ adults   │ man      │ yes      │
// │ 14 │ 15       │ 1st class │ adults   │ man      │ yes      │
// │ 15 │ 16       │ 1st class │ adults   │ man      │ yes      │
// │ 16 │ 17       │ 1st class │ adults   │ man      │ yes      │
// │ 17 │ 18       │ 1st class │ adults   │ man      │ yes      │
// │ 18 │ 19       │ 1st class │ adults   │ man      │ yes      │
// │ 19 │ 20       │ 1st class │ adults   │ man      │ yes      │
// ┢╍╍╍╍┷╍╍╍╍╍╍╍╍╍╍┷╍╍╍╍╍╍╍╍╍╍╍┷╍╍╍╍╍╍╍╍╍╍┷╍╍╍╍╍╍╍╍╍╍┷╍╍╍╍╍╍╍╍╍╍┪
// ┇ ...                                                        ┇
// ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
// 1,316 rows, 5 columns

```

------------------------------------------------------------------------

## References

### Functions, packages, repositories

\[AAf1\] Anton Antonov,
[`ExampleDataset`](https://resources.wolframcloud.com/FunctionRepository/resources/ExampleDataset),
(2020), [Wolfram Function
Repository](https://resources.wolframcloud.com/FunctionRepository).

\[AAr1\] Anton Antonov,
[`Data::ExampleDatasets Raku package`](https://github.com/antononcube/Raku-Data-ExampleDatasets),
(2021), [GitHub/antononcube](https://github.com/antononcube).

\[AAp1\] Anton Antonov,
[`ExampleDatasets Python package`](https://pypi.org/project/ExampleDatasets/),
(2021-2022), [PyPI.org/antononcube](https://pypi.org/user/antononcube/).

\[VAB1\] Vincent Arel-Bundock,
[Rdatasets](https://github.com/vincentarelbundock/Rdatasets/), (2020),
[GitHub/vincentarelbundock](https://github.com/vincentarelbundock).

\[SS1\] Scott Stevenson, [xdg Python package](https://pypi.org/project/xdg/), (2016-2021),
[PyPI.org](https://pypi.org/project/xdg/).

### Interactive interfaces

\[AAi1\] Anton Antonov, [Example datasets recommender interface](https://antononcube.shinyapps.io/ExampleDatasetsRecommenderInterface/),
(2021), [Shinyapps.io](https://antononcube.shinyapps.io/).
