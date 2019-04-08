Titanic
================

Introduction
------------

In this project, I get the data from the [Kaggle Titanic dataset](https://www.kaggle.com/c/titanic/data) cleaned up and ready for analysis. The first step in getting the data ready is to load the appropriate libraries and to load the data into memory, using the code below.

``` r
library(dplyr)
library(tidyr)
titanic_data <- tbl_df(read.csv("titanic_original.csv"))
```

The first 25 rows of the raw data are shown below:

<table>
<colgroup>
<col width="4%" />
<col width="5%" />
<col width="27%" />
<col width="4%" />
<col width="4%" />
<col width="3%" />
<col width="3%" />
<col width="5%" />
<col width="5%" />
<col width="4%" />
<col width="5%" />
<col width="3%" />
<col width="3%" />
<col width="17%" />
</colgroup>
<thead>
<tr class="header">
<th align="right">pclass</th>
<th align="right">survived</th>
<th align="left">name</th>
<th align="left">sex</th>
<th align="right">age</th>
<th align="right">sibsp</th>
<th align="right">parch</th>
<th align="left">ticket</th>
<th align="right">fare</th>
<th align="left">cabin</th>
<th align="left">embarked</th>
<th align="left">boat</th>
<th align="right">body</th>
<th align="left">home.dest</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Allen, Miss. Elisabeth Walton</td>
<td align="left">female</td>
<td align="right">29.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">24160</td>
<td align="right">211.3375</td>
<td align="left">B5</td>
<td align="left">S</td>
<td align="left">2</td>
<td align="right">NA</td>
<td align="left">St Louis, MO</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Allison, Master. Hudson Trevor</td>
<td align="left">male</td>
<td align="right">0.9167</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left">11</td>
<td align="right">NA</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Allison, Miss. Helen Loraine</td>
<td align="left">female</td>
<td align="right">2.0000</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left"></td>
<td align="right">NA</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Allison, Mr. Hudson Joshua Creighton</td>
<td align="left">male</td>
<td align="right">30.0000</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left"></td>
<td align="right">135</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Allison, Mrs. Hudson J C (Bessie Waldo Daniels)</td>
<td align="left">female</td>
<td align="right">25.0000</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left"></td>
<td align="right">NA</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Anderson, Mr. Harry</td>
<td align="left">male</td>
<td align="right">48.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">19952</td>
<td align="right">26.5500</td>
<td align="left">E12</td>
<td align="left">S</td>
<td align="left">3</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Andrews, Miss. Kornelia Theodosia</td>
<td align="left">female</td>
<td align="right">63.0000</td>
<td align="right">1</td>
<td align="right">0</td>
<td align="left">13502</td>
<td align="right">77.9583</td>
<td align="left">D7</td>
<td align="left">S</td>
<td align="left">10</td>
<td align="right">NA</td>
<td align="left">Hudson, NY</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Andrews, Mr. Thomas Jr</td>
<td align="left">male</td>
<td align="right">39.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">112050</td>
<td align="right">0.0000</td>
<td align="left">A36</td>
<td align="left">S</td>
<td align="left"></td>
<td align="right">NA</td>
<td align="left">Belfast, NI</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Appleton, Mrs. Edward Dale (Charlotte Lamson)</td>
<td align="left">female</td>
<td align="right">53.0000</td>
<td align="right">2</td>
<td align="right">0</td>
<td align="left">11769</td>
<td align="right">51.4792</td>
<td align="left">C101</td>
<td align="left">S</td>
<td align="left">D</td>
<td align="right">NA</td>
<td align="left">Bayside, Queens, NY</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Artagaveytia, Mr. Ramon</td>
<td align="left">male</td>
<td align="right">71.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17609</td>
<td align="right">49.5042</td>
<td align="left"></td>
<td align="left">C</td>
<td align="left"></td>
<td align="right">22</td>
<td align="left">Montevideo, Uruguay</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Astor, Col. John Jacob</td>
<td align="left">male</td>
<td align="right">47.0000</td>
<td align="right">1</td>
<td align="right">0</td>
<td align="left">PC 17757</td>
<td align="right">227.5250</td>
<td align="left">C62 C64</td>
<td align="left">C</td>
<td align="left"></td>
<td align="right">124</td>
<td align="left">New York, NY</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Astor, Mrs. John Jacob (Madeleine Talmadge Force)</td>
<td align="left">female</td>
<td align="right">18.0000</td>
<td align="right">1</td>
<td align="right">0</td>
<td align="left">PC 17757</td>
<td align="right">227.5250</td>
<td align="left">C62 C64</td>
<td align="left">C</td>
<td align="left">4</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Aubart, Mme. Leontine Pauline</td>
<td align="left">female</td>
<td align="right">24.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17477</td>
<td align="right">69.3000</td>
<td align="left">B35</td>
<td align="left">C</td>
<td align="left">9</td>
<td align="right">NA</td>
<td align="left">Paris, France</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Barber, Miss. Ellen &quot;Nellie&quot;</td>
<td align="left">female</td>
<td align="right">26.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">19877</td>
<td align="right">78.8500</td>
<td align="left"></td>
<td align="left">S</td>
<td align="left">6</td>
<td align="right">NA</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Barkworth, Mr. Algernon Henry Wilson</td>
<td align="left">male</td>
<td align="right">80.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">27042</td>
<td align="right">30.0000</td>
<td align="left">A23</td>
<td align="left">S</td>
<td align="left">B</td>
<td align="right">NA</td>
<td align="left">Hessle, Yorks</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Baumann, Mr. John D</td>
<td align="left">male</td>
<td align="right">NA</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17318</td>
<td align="right">25.9250</td>
<td align="left"></td>
<td align="left">S</td>
<td align="left"></td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Baxter, Mr. Quigg Edmond</td>
<td align="left">male</td>
<td align="right">24.0000</td>
<td align="right">0</td>
<td align="right">1</td>
<td align="left">PC 17558</td>
<td align="right">247.5208</td>
<td align="left">B58 B60</td>
<td align="left">C</td>
<td align="left"></td>
<td align="right">NA</td>
<td align="left">Montreal, PQ</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Baxter, Mrs. James (Helene DeLaudeniere Chaput)</td>
<td align="left">female</td>
<td align="right">50.0000</td>
<td align="right">0</td>
<td align="right">1</td>
<td align="left">PC 17558</td>
<td align="right">247.5208</td>
<td align="left">B58 B60</td>
<td align="left">C</td>
<td align="left">6</td>
<td align="right">NA</td>
<td align="left">Montreal, PQ</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Bazzani, Miss. Albina</td>
<td align="left">female</td>
<td align="right">32.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">11813</td>
<td align="right">76.2917</td>
<td align="left">D15</td>
<td align="left">C</td>
<td align="left">8</td>
<td align="right">NA</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Beattie, Mr. Thomson</td>
<td align="left">male</td>
<td align="right">36.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">13050</td>
<td align="right">75.2417</td>
<td align="left">C6</td>
<td align="left">C</td>
<td align="left">A</td>
<td align="right">NA</td>
<td align="left">Winnipeg, MN</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Beckwith, Mr. Richard Leonard</td>
<td align="left">male</td>
<td align="right">37.0000</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="left">11751</td>
<td align="right">52.5542</td>
<td align="left">D35</td>
<td align="left">S</td>
<td align="left">5</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Beckwith, Mrs. Richard Leonard (Sallie Monypeny)</td>
<td align="left">female</td>
<td align="right">47.0000</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="left">11751</td>
<td align="right">52.5542</td>
<td align="left">D35</td>
<td align="left">S</td>
<td align="left">5</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Behr, Mr. Karl Howell</td>
<td align="left">male</td>
<td align="right">26.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">111369</td>
<td align="right">30.0000</td>
<td align="left">C148</td>
<td align="left">C</td>
<td align="left">5</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Bidois, Miss. Rosalie</td>
<td align="left">female</td>
<td align="right">42.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17757</td>
<td align="right">227.5250</td>
<td align="left"></td>
<td align="left">C</td>
<td align="left">4</td>
<td align="right">NA</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Bird, Miss. Ellen</td>
<td align="left">female</td>
<td align="right">29.0000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17483</td>
<td align="right">221.7792</td>
<td align="left">C97</td>
<td align="left">S</td>
<td align="left">8</td>
<td align="right">NA</td>
<td align="left"></td>
</tr>
</tbody>
</table>

Replacing missing embarkation data
----------------------------------

Some of the passengers did not have their port of embarkation recorded in the data. It is known, however, that all of these passengers embark from Southampton. Therefore, all of the empty embarkation data points are replaced with an 'S' using the code below; note that the missing values were shown as empty strings:

``` r
titanic_data <- titanic_data %>%
  mutate(embarked = replace(embarked, embarked == "", "S"))
```

Replacing missing age values
----------------------------

Some of the passengers' ages were not recorded. The mean passenger age was therefore added as a placeholder using the code below. Other things that might have made sense to do instead would be things like using the median age, or coding a non-sensical value such as 999 to show mising age values.

``` r
mean_age = mean(titanic_data$age, na.rm = TRUE)
titanic_data <- titanic_data %>% 
  mutate(age = replace(age, is.na(age), mean_age))
```

Replace missing lifeboat values with 'None'
-------------------------------------------

As is well-known, many of the Titanic passengers did not make it onto a lifeboat. These passengers have missing values in the Lifeboat column, which are replaced with "None". The code below does this; note that the lifeboat was initially coded as an integer, which had to be changed to a character value to accommodate the string "None".

``` r
titanic_data <- titanic_data %>% 
  mutate(boat = as.character(boat)) %>% 
  mutate(boat = replace(boat, boat == "", "None"))
```

Adding has\_cabin\_number row
-----------------------------

Some of the passengers' cabin numbers were not recorded--this may be related to their survival, since documents were likely lost when the Titanic sank. The code below adds a column labeled 'has\_cabin\_number' to indicate whether or not a cabin number was recorded for each passenger:

``` r
titanic_data <- titanic_data %>% 
  mutate(has_cabin_number = case_when(cabin == "" ~ 0,
                                      TRUE ~ 1))
```

Outputting CSV file
-------------------

Finally, the code below outputs a CSV file from the processed data:

``` r
write.csv(titanic_data, file="titanic_clean.csv", row.names = FALSE, quote = TRUE)
```

A brief summary (the first 25 rows) of the processed data is shown below:

<table>
<colgroup>
<col width="3%" />
<col width="4%" />
<col width="25%" />
<col width="3%" />
<col width="4%" />
<col width="3%" />
<col width="3%" />
<col width="4%" />
<col width="4%" />
<col width="4%" />
<col width="4%" />
<col width="2%" />
<col width="2%" />
<col width="16%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="right">pclass</th>
<th align="right">survived</th>
<th align="left">name</th>
<th align="left">sex</th>
<th align="right">age</th>
<th align="right">sibsp</th>
<th align="right">parch</th>
<th align="left">ticket</th>
<th align="right">fare</th>
<th align="left">cabin</th>
<th align="left">embarked</th>
<th align="left">boat</th>
<th align="right">body</th>
<th align="left">home.dest</th>
<th align="right">has_cabin_number</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Allen, Miss. Elisabeth Walton</td>
<td align="left">female</td>
<td align="right">29.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">24160</td>
<td align="right">211.3375</td>
<td align="left">B5</td>
<td align="left">S</td>
<td align="left">2</td>
<td align="right">NA</td>
<td align="left">St Louis, MO</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Allison, Master. Hudson Trevor</td>
<td align="left">male</td>
<td align="right">0.91670</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left">11</td>
<td align="right">NA</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Allison, Miss. Helen Loraine</td>
<td align="left">female</td>
<td align="right">2.00000</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left">None</td>
<td align="right">NA</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Allison, Mr. Hudson Joshua Creighton</td>
<td align="left">male</td>
<td align="right">30.00000</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left">None</td>
<td align="right">135</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Allison, Mrs. Hudson J C (Bessie Waldo Daniels)</td>
<td align="left">female</td>
<td align="right">25.00000</td>
<td align="right">1</td>
<td align="right">2</td>
<td align="left">113781</td>
<td align="right">151.5500</td>
<td align="left">C22 C26</td>
<td align="left">S</td>
<td align="left">None</td>
<td align="right">NA</td>
<td align="left">Montreal, PQ / Chesterville, ON</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Anderson, Mr. Harry</td>
<td align="left">male</td>
<td align="right">48.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">19952</td>
<td align="right">26.5500</td>
<td align="left">E12</td>
<td align="left">S</td>
<td align="left">3</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Andrews, Miss. Kornelia Theodosia</td>
<td align="left">female</td>
<td align="right">63.00000</td>
<td align="right">1</td>
<td align="right">0</td>
<td align="left">13502</td>
<td align="right">77.9583</td>
<td align="left">D7</td>
<td align="left">S</td>
<td align="left">10</td>
<td align="right">NA</td>
<td align="left">Hudson, NY</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Andrews, Mr. Thomas Jr</td>
<td align="left">male</td>
<td align="right">39.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">112050</td>
<td align="right">0.0000</td>
<td align="left">A36</td>
<td align="left">S</td>
<td align="left">None</td>
<td align="right">NA</td>
<td align="left">Belfast, NI</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Appleton, Mrs. Edward Dale (Charlotte Lamson)</td>
<td align="left">female</td>
<td align="right">53.00000</td>
<td align="right">2</td>
<td align="right">0</td>
<td align="left">11769</td>
<td align="right">51.4792</td>
<td align="left">C101</td>
<td align="left">S</td>
<td align="left">D</td>
<td align="right">NA</td>
<td align="left">Bayside, Queens, NY</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Artagaveytia, Mr. Ramon</td>
<td align="left">male</td>
<td align="right">71.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17609</td>
<td align="right">49.5042</td>
<td align="left"></td>
<td align="left">C</td>
<td align="left">None</td>
<td align="right">22</td>
<td align="left">Montevideo, Uruguay</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Astor, Col. John Jacob</td>
<td align="left">male</td>
<td align="right">47.00000</td>
<td align="right">1</td>
<td align="right">0</td>
<td align="left">PC 17757</td>
<td align="right">227.5250</td>
<td align="left">C62 C64</td>
<td align="left">C</td>
<td align="left">None</td>
<td align="right">124</td>
<td align="left">New York, NY</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Astor, Mrs. John Jacob (Madeleine Talmadge Force)</td>
<td align="left">female</td>
<td align="right">18.00000</td>
<td align="right">1</td>
<td align="right">0</td>
<td align="left">PC 17757</td>
<td align="right">227.5250</td>
<td align="left">C62 C64</td>
<td align="left">C</td>
<td align="left">4</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Aubart, Mme. Leontine Pauline</td>
<td align="left">female</td>
<td align="right">24.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17477</td>
<td align="right">69.3000</td>
<td align="left">B35</td>
<td align="left">C</td>
<td align="left">9</td>
<td align="right">NA</td>
<td align="left">Paris, France</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Barber, Miss. Ellen &quot;Nellie&quot;</td>
<td align="left">female</td>
<td align="right">26.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">19877</td>
<td align="right">78.8500</td>
<td align="left"></td>
<td align="left">S</td>
<td align="left">6</td>
<td align="right">NA</td>
<td align="left"></td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Barkworth, Mr. Algernon Henry Wilson</td>
<td align="left">male</td>
<td align="right">80.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">27042</td>
<td align="right">30.0000</td>
<td align="left">A23</td>
<td align="left">S</td>
<td align="left">B</td>
<td align="right">NA</td>
<td align="left">Hessle, Yorks</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Baumann, Mr. John D</td>
<td align="left">male</td>
<td align="right">29.88113</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17318</td>
<td align="right">25.9250</td>
<td align="left"></td>
<td align="left">S</td>
<td align="left">None</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Baxter, Mr. Quigg Edmond</td>
<td align="left">male</td>
<td align="right">24.00000</td>
<td align="right">0</td>
<td align="right">1</td>
<td align="left">PC 17558</td>
<td align="right">247.5208</td>
<td align="left">B58 B60</td>
<td align="left">C</td>
<td align="left">None</td>
<td align="right">NA</td>
<td align="left">Montreal, PQ</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Baxter, Mrs. James (Helene DeLaudeniere Chaput)</td>
<td align="left">female</td>
<td align="right">50.00000</td>
<td align="right">0</td>
<td align="right">1</td>
<td align="left">PC 17558</td>
<td align="right">247.5208</td>
<td align="left">B58 B60</td>
<td align="left">C</td>
<td align="left">6</td>
<td align="right">NA</td>
<td align="left">Montreal, PQ</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Bazzani, Miss. Albina</td>
<td align="left">female</td>
<td align="right">32.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">11813</td>
<td align="right">76.2917</td>
<td align="left">D15</td>
<td align="left">C</td>
<td align="left">8</td>
<td align="right">NA</td>
<td align="left"></td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">0</td>
<td align="left">Beattie, Mr. Thomson</td>
<td align="left">male</td>
<td align="right">36.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">13050</td>
<td align="right">75.2417</td>
<td align="left">C6</td>
<td align="left">C</td>
<td align="left">A</td>
<td align="right">NA</td>
<td align="left">Winnipeg, MN</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Beckwith, Mr. Richard Leonard</td>
<td align="left">male</td>
<td align="right">37.00000</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="left">11751</td>
<td align="right">52.5542</td>
<td align="left">D35</td>
<td align="left">S</td>
<td align="left">5</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Beckwith, Mrs. Richard Leonard (Sallie Monypeny)</td>
<td align="left">female</td>
<td align="right">47.00000</td>
<td align="right">1</td>
<td align="right">1</td>
<td align="left">11751</td>
<td align="right">52.5542</td>
<td align="left">D35</td>
<td align="left">S</td>
<td align="left">5</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
<td align="right">1</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Behr, Mr. Karl Howell</td>
<td align="left">male</td>
<td align="right">26.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">111369</td>
<td align="right">30.0000</td>
<td align="left">C148</td>
<td align="left">C</td>
<td align="left">5</td>
<td align="right">NA</td>
<td align="left">New York, NY</td>
<td align="right">1</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Bidois, Miss. Rosalie</td>
<td align="left">female</td>
<td align="right">42.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17757</td>
<td align="right">227.5250</td>
<td align="left"></td>
<td align="left">C</td>
<td align="left">4</td>
<td align="right">NA</td>
<td align="left"></td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">Bird, Miss. Ellen</td>
<td align="left">female</td>
<td align="right">29.00000</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="left">PC 17483</td>
<td align="right">221.7792</td>
<td align="left">C97</td>
<td align="left">S</td>
<td align="left">8</td>
<td align="right">NA</td>
<td align="left"></td>
<td align="right">1</td>
</tr>
</tbody>
</table>
