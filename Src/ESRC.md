Economic and Social Research Council (ESRC) Data
================
**Author**: Mario Antonioletti.<br/>
**Last updated**: 14/03/22.

-   [Introduction](#introduction)
-   [Overall expenditure](#overall-expenditure)
    -   [Expenditure for all UKRI
        projects](#expenditure-for-all-ukri-projects)
        -   [Summary](#summary)
    -   [Expenditure for active UKRI projects
        only](#expenditure-for-active-ukri-projects-only)
-   [ESRC data](#esrc-data)
    -   [Project category awards](#project-category-awards)
        -   [All projects category
            awards](#all-projects-category-awards)
        -   [Active projects category awards
            only](#active-projects-category-awards-only)
    -   [Award length distribution](#award-length-distribution)
        -   [Award length distribution for all
            projects](#award-length-distribution-for-all-projects)
        -   [Award length distribution for active projects
            only](#award-length-distribution-for-active-projects-only)
    -   [Regional distribution of
        awards](#regional-distribution-of-awards)
        -   [Region distributions of awards for all
            projects](#region-distributions-of-awards-for-all-projects)
        -   [Regional distributions of awards for active projects
            only](#regional-distributions-of-awards-for-active-projects-only)
    -   [Funding by lead organisation](#funding-by-lead-organisation)
        -   [Funding by lead organisation for all
            projects](#funding-by-lead-organisation-for-all-projects)
        -   [Funding by lead organisation for active projects
            only](#funding-by-lead-organisation-for-active-projects-only)
    -   [Department awards](#department-awards)
        -   [Department awards for all
            projects](#department-awards-for-all-projects)
        -   [Department awards for active projects
            only](#department-awards-for-active-projects-only)
    -   [Doctoral Training
        Partnerships](#doctoral-training-partnerships)
        -   [Active Partnerships](#active-partnerships)
    -   [Award Titles](#award-titles)
        -   [Active award titles](#active-award-titles)
    -   [Classification by category](#classification-by-category)

# Introduction

The aim of this document is to provide an overview of the awards
provided by the [United Kingdom Research and
Innovation](https://www.ukri.org/)’s (UKRI) [Economics and Social
Sciences Research Council](https://esrc.ukri.org/) (ESRC) as determined
from a [Gateway to Research](https://gtr.ukri.org/) (GtR) data snapshot
update from the the 24th February 2022 - these data snapshots update
come out roughly every month. The data is made available under an [Open
Government
Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/),
and covers the period from 01/01/73 to 01/01/30.

The R markdown that generated this analysis is available at:

-   <https://github.com/softwaresaved/esrc-software-study/blob/main/Src/ESRC.Rmd>

The entire data set consists of 128,238 rows for all research councils,
where each row corresponds to a record of an award. Within this data set
11,598 rows (9%) correspond to ESRC awards.

UK Research Councils were formed in different years (source:
[wikipedia](https://en.wikipedia.org/wiki/UK_Research_and_Innovation))
as shown in the table below which has an impact in the interpretation of
the data.

| Research Council                                                                             | Formation |
|----------------------------------------------------------------------------------------------|-----------|
| Arts and Humanities Research Council (AHRC)                                                  | 2005      |
| Biotechnology and Biological Sciences Research Council (BBSRC)                               | 1994      |
| Engineering and Physical Sciences Research Council (EPSRC)                                   | 1994      |
| Economic and Social Research Council (ESRC)                                                  | 1965      |
| Medical Research Council (MRC)                                                               | 1913      |
| National Centre for the Replacement, Refinement and Reduction of Animals in Research (NC3RS) | 2004      |
| Natural Environment Research Council (NERC)                                                  | 1965      |
| Science and Technology Facilities Council (STFC)                                             | 2007      |
| Innovate UK                                                                                  | 2007      |
| Research England                                                                             | 2018      |
| UKRI                                                                                         | 2018      |

Although, strictly speaking, it was the *Social Science Research
Council* (SSRC) that came into being in 1965, it was not until 1983 that
the SSRC was renamed the Economic and Social Research Council (ESRC).

# Overall expenditure

We start by doing a brief overview of all the data obtained from the
Gateway to Research before we go on to focus on the ESRC data.

## Expenditure for all UKRI projects

Expenditure for the whole period under consideration is shown in the
graph below. Awards that do not have an awards value defined have been
removed.

<img src="ESRC_files/figure-gfm/funding_ByOrg-1.png" title="Expenditure across each UKRI council from the available data." alt="Expenditure across each UKRI council from the available data."  />

The same information in tabular format:

| Funding org | Total awarded (Million £s) |
|:------------|---------------------------:|
| EPSRC       |                     15,262 |
| Innovate UK |                     11,940 |
| MRC         |                      6,268 |
| BBSRC       |                      4,732 |
| ESRC        |                      3,501 |
| NERC        |                      3,350 |
| STFC        |                      2,364 |
| AHRC        |                      1,261 |
| UKRI        |                        392 |
| NC3Rs       |                         73 |

The number of awards given by each council over the whole data period:

<img src="ESRC_files/figure-gfm/NumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils from the available data." alt="Number of awards across each UKRI councils from the available data."  />

The average award given by funding council:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilPlot-1.png" title="Average award size given in pounds per funding council." alt="Average award size given in pounds per funding council."  />

Average award per founding council ordered by the average award in
tabular form:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| UKRI        |              393 |       391,911,795 |           997,231 |
| MRC         |           10,166 |     6,267,924,420 |           616,558 |
| Innovate UK |           25,000 |    11,939,854,589 |           477,594 |
| EPSRC       |           33,238 |    15,261,747,133 |           459,166 |
| STFC        |            7,112 |     2,364,288,736 |           332,437 |
| NERC        |           10,759 |     3,350,291,272 |           311,394 |
| ESRC        |           11,598 |     3,501,153,022 |           301,876 |
| BBSRC       |           16,178 |     4,732,082,523 |           292,501 |
| NC3Rs       |              463 |        73,384,156 |           158,497 |
| AHRC        |            9,662 |     1,261,472,322 |           130,560 |

The distribution of awards by research council.

<img src="ESRC_files/figure-gfm/AwardDistrPerFundCouncil-1.png" title="Distribution of award size by research council." alt="Distribution of award size by research council."  />

The graph with the values for each research council normalised:

<img src="ESRC_files/figure-gfm/AwardDistrPerFundCouncilScaled-1.png" title="Distribution of award size by research council with the graphs scaled." alt="Distribution of award size by research council with the graphs scaled."  />

Expenditure by year using the starting year of the award for funds
allocated that year per research council:

<img src="ESRC_files/figure-gfm/funding_ByOrgByYear-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

The same information by percent expenditure for each year.

<img src="ESRC_files/figure-gfm/funding_ByOrgByYearPer-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

Although there seems to be historical data for the MRC, ESRC and STFC it
seems to make more sense to start looking at the data from 2008 (this
will be applied later).

### Summary

-   Over the time covered by the data, EPSRC has been allocated the most
    money but they also give the most awards so on average they do not
    give the highest award.
-   The MRC have been given the third highest amount but, other than
    UKRI, they give the second highest average award.
-   Of interest to this particular study the ESRC comes in fifth in the
    total amount awarded and they give the fourth highest number of
    awards so their average over the research councils comes third.
-   At a later point only data from 2008 and onwards will be considered.

## Expenditure for active UKRI projects only

The graph below only contains values for currently active projects,
i.e. whose end date extends beyond the date at which the GtR data
snapshot was produced:

<img src="ESRC_files/figure-gfm/Activefunding_ByOrg_active-1.png" title="Expenditure across all UKRI councils for active projects from the available data." alt="Expenditure across all UKRI councils for active projects from the available data."  />

The same information in tabular format:

| Funding org | Total awarded (Million £s) |
|:------------|---------------------------:|
| EPSRC       |                      6,304 |
| Innovate UK |                      4,791 |
| ESRC        |                      1,766 |
| MRC         |                      1,745 |
| NERC        |                      1,443 |
| BBSRC       |                      1,367 |
| STFC        |                        741 |
| AHRC        |                        443 |
| UKRI        |                        382 |
| NC3Rs       |                         21 |

The number of awards given by each council for active projects:

<img src="ESRC_files/figure-gfm/ActiveNumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils for active projects from the available data." alt="Number of awards across each UKRI councils for active projects from the available data."  />

The average award given by funding council for active projects:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilActProjPlot-1.png" title="Average award size given in pounds per funding council for active projects." alt="Average award size given in pounds per funding council for active projects."  />

Average award per founding council for active projects ordered by the
average award:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| Innovate UK |            3,448 |     4,790,776,011 |         1,389,436 |
| UKRI        |              382 |       382,101,075 |         1,000,265 |
| MRC         |            3,386 |     1,745,442,053 |           515,488 |
| NERC        |            3,323 |     1,443,216,024 |           434,311 |
| EPSRC       |           15,385 |     6,303,746,217 |           409,733 |
| ESRC        |            4,944 |     1,766,391,182 |           357,280 |
| BBSRC       |            4,538 |     1,366,783,223 |           301,186 |
| STFC        |            2,719 |       740,988,391 |           272,522 |
| AHRC        |            3,352 |       443,171,889 |           132,211 |
| NC3Rs       |              172 |        20,698,414 |           120,340 |

The distribution of awards by research council for active projects.

<img src="ESRC_files/figure-gfm/ActiveAwardDistrPerFundCouncil-1.png" title="Distribution of award size by research council for active projects." alt="Distribution of award size by research council for active projects."  />

With the densities normalised for each research council:

<img src="ESRC_files/figure-gfm/ActiveAwardDistrPerFundCouncilScaled-1.png" title="Distribution of award size by research council for active projects with the graphs scaled." alt="Distribution of award size by research council for active projects with the graphs scaled."  />

Expenditure by year using the starting year of the award for funds
allocated that year per research council for active projects:

<img src="ESRC_files/figure-gfm/funding_ByOrgByYearAct-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

<img src="ESRC_files/figure-gfm/funding_ByOrgByYearActPer-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

# ESRC data

## Project category awards

### All projects category awards

The project categories for the ESRC awards covers the period 01/01/06 to
30/09/29 (project start dates - to project end dates). However, as
previously stated data only projects that started from 2008 onwards will
be considered from this point onwards reduces the number of records from
11598 to 10374.

``` r
esrcdat <- esrcdat[year(esrcdat$StartDate) >= 2008,]
```

No explicit expenditure data seems to be provided for *Studentships*.
Data is sorted by the average award.

| Project Catgeory | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-----------------|-----------------:|------------------:|------------------:|
| Research Grant   |            5,166 |     2,548,848,403 |         493389.16 |
| Training Grant   |              403 |       574,573,855 |        1425741.58 |
| Fellowship       |            1,156 |       125,637,540 |         108682.99 |
| Studentship      |            3,649 |                 0 |              0.00 |

![](ESRC_files/figure-gfm/esrc_categoriesByYear-1.png)<!-- -->

![](ESRC_files/figure-gfm/esrc_categoriesByPercYear-1.png)<!-- -->

### Active projects category awards only

This information corresponds to projects that are classified as
*Active*.

| Project Catgeory | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-----------------|-----------------:|------------------:|------------------:|
| Research Grant   |            1,262 |     1,253,900,235 |         993581.80 |
| Training Grant   |               65 |       479,756,418 |        7380867.97 |
| Fellowship       |              280 |        32,734,529 |         116909.03 |
| Studentship      |            3,337 |                 0 |              0.00 |

![](ESRC_files/figure-gfm/esrc_categoriesByYearAct-1.png)<!-- -->

![](ESRC_files/figure-gfm/esrc_categoriesByPercYearAct-1.png)<!-- -->

## Award length distribution

### Award length distribution for all projects

The award length distribution of the award lengths binned into 28-day
periods is shown below.

<img src="ESRC_files/figure-gfm/award_lengths-1.png" title="Histogram of the length distribution for all projects." alt="Histogram of the length distribution for all projects."  />

Look at the award given by the length of project by project category for
all projects.

<img src="ESRC_files/figure-gfm/award_lengthsVsAwardSize-1.png" title="Award length vs Award size projects." alt="Award length vs Award size projects."  />

The top 15 active projects:

|                               Lead Org |       Category | Total awarded (£) |                                                           Project title |
|---------------------------------------:|---------------:|------------------:|------------------------------------------------------------------------:|
|                    University of Essex | Research Grant |        49,115,852 | Understanding Society: The UK Household Longitudinal Survey Waves 13-15 |
|              University College London | Research Grant |        36,267,415 |                Centre for Longitudinal Studies, Resource Centre 2015-20 |
|                    University of Essex | Research Grant |        31,987,749 |                                      Understanding Society Waves 6 to 8 |
|                    University of Essex | Research Grant |        31,322,728 |                                             UK Data Service (2017-2022) |
|                    University of Essex | Research Grant |        30,212,001 |  Understanding Society: The UK Household Longitudinal Study: Waves 9-11 |
|                University of Edinburgh | Training Grant |        27,538,201 |                       Scottish ESRC Doctoral Training Centre DTC 2011 - |
|               University of Manchester | Research Grant |        26,621,454 |                                              The Productivity Institute |
|                University of Liverpool | Training Grant |        24,932,784 |                       North West ESRC Doctoral Training Centre DTG 2011 |
|                University of Sheffield | Training Grant |        21,107,576 |                       White Rose ESRC Doctoral Training Centre DTG 2011 |
|                   University of Oxford | Training Grant |        19,130,626 |             University of Oxford ESRC Doctoral Training Centre DTG 2011 |
|                    Coventry University | Research Grant |        18,759,063 |              GCRF South-South Migration, Inequality and Development Hub |
|                   University of Oxford | Research Grant |        18,531,197 |              GCRF Accelerating Achievement for Africa’s Adolescents Hub |
|              University College London | Training Grant |        18,280,789 |           UCL, Bloomsbury and East London Doctoral Training Partnership |
| World Conservation Monitoring Ctr WCMC | Research Grant |        18,239,311 |                         GCRF Trade, Development and the Environment Hub |
|                University of Liverpool | Training Grant |        17,857,544 |       North West Social Science Doctoral Training Partnership (NWSSDTP) |

### Award length distribution for active projects only

The same information as provided above but only for *Active* projects.
The maximum funding period corresponds to 4382 days.

<img src="ESRC_files/figure-gfm/award_lengths_active-1.png" title="Histogram of the length distribution for active projects only." alt="Histogram of the length distribution for active projects only."  />

The top length of awards lie by project category in days is tabulated
below.

| Number of days | Project Category | Number of projects |
|---------------:|:-----------------|-------------------:|
|           1460 | Studentship      |                740 |
|           1095 | Studentship      |                300 |
|           1095 | Research Grant   |                188 |
|           1277 | Studentship      |                159 |
|           1094 | Studentship      |                152 |
|            364 | Fellowship       |                151 |
|           1460 | Research Grant   |                 99 |
|           1552 | Studentship      |                 85 |
|           1464 | Studentship      |                 74 |
|           1187 | Studentship      |                 71 |
|            729 | Research Grant   |                 69 |
|           1094 | Research Grant   |                 69 |
|            545 | Research Grant   |                 62 |
|           1461 | Studentship      |                 62 |
|            364 | Research Grant   |                 61 |

Percentage of award types by time length.

<img src="ESRC_files/figure-gfm/award_lengths_active_fill-1.png" title="Percentage distribution of project type by the length of awards." alt="Percentage distribution of project type by the length of awards."  />

Look at the award given by the length of project by project category for
active projects.

<img src="ESRC_files/figure-gfm/award_lengthsVsAwardSizeForActiveProjects-1.png" title="Award length vs Award size for active projects." alt="Award length vs Award size for active projects."  />

## Regional distribution of awards

### Region distributions of awards for all projects

The expenditure of the awards over the whole time period by region
ordered by the total award given is shown in the table below.

| Region                   | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------|-----------------:|------------------:|------------------:|
| Unknown                  |            3,511 |     1,040,994,020 |         296495.02 |
| London                   |            1,504 |       433,340,480 |         288125.32 |
| South East               |            1,481 |       399,540,289 |         269777.37 |
| East of England          |              183 |       335,868,903 |        1835349.20 |
| Scotland                 |            1,025 |       304,558,712 |         297130.45 |
| North West               |              694 |       189,191,900 |         272610.81 |
| South West               |              493 |       133,789,672 |         271378.65 |
| West Midlands            |              354 |       110,179,317 |         311241.01 |
| East Midlands            |              383 |        82,964,712 |         216618.05 |
| Wales                    |              189 |        69,380,128 |         367090.62 |
| Yorkshire and The Humber |              291 |        51,671,632 |         177565.75 |
| Northern Ireland         |              143 |        51,429,447 |         359646.48 |
| Outside UK               |               82 |        41,002,086 |         500025.44 |
| North East               |               39 |         4,620,877 |         118484.03 |
| NA                       |                2 |           527,623 |         263811.50 |

### Regional distributions of awards for active projects only

We can generate the table for projects that are currently active ordered
by the total award given is shown in the table below.

| Region                   | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------|-----------------:|------------------:|------------------:|
| Unknown                  |            1,817 |       596,141,468 |         328091.07 |
| East of England          |               76 |       221,920,343 |        2920004.51 |
| London                   |              698 |       202,710,650 |         290416.40 |
| South East               |              686 |       191,757,717 |         279530.20 |
| Scotland                 |              464 |       168,722,647 |         363626.39 |
| North West               |              314 |        98,176,988 |         312665.57 |
| South West               |              245 |        77,239,538 |         315263.42 |
| West Midlands            |              140 |        66,614,179 |         475815.56 |
| Wales                    |              111 |        42,259,224 |         380713.73 |
| East Midlands            |              176 |        38,895,480 |         220997.05 |
| Northern Ireland         |               57 |        22,834,484 |         400604.98 |
| Yorkshire and The Humber |              120 |        19,329,286 |         161077.38 |
| Outside UK               |               26 |        17,845,281 |         686356.96 |
| North East               |               13 |         1,843,525 |         141809.62 |
| NA                       |                1 |           100,372 |         100372.00 |

## Funding by lead organisation

### Funding by lead organisation for all projects

This only shows the top 25 organisations by the average value of the
award.

| Org                                     | Number of Awards | Total Awarded (£) | Average Award (£) |
|:----------------------------------------|-----------------:|------------------:|------------------:|
| University of Huddersfield              |                9 |           884,820 |          98313.33 |
| University of the West of England       |               45 |         4,406,789 |          97928.64 |
| University of Copenhagen                |                1 |            97,614 |          97614.00 |
| NERC British Geological Survey          |                1 |             9,753 |           9753.00 |
| University of the West of Scotland      |                5 |           473,006 |          94601.20 |
| University of Cape Town                 |                6 |         5,670,678 |         945113.00 |
| Manchester Metropolitan University      |               64 |         5,840,048 |          91250.75 |
| Canterbury Christ Church University     |                2 |           181,236 |          90618.00 |
| Office for National Statistics          |                2 |        17,898,948 |        8949474.00 |
| University of the Highlands and Islands |                3 |           264,465 |          88155.00 |
| Quadram Institute Bioscience            |                1 |            87,062 |          87062.00 |
| Johns Hopkins University                |                1 |           865,561 |         865561.00 |
| Glasgow Caledonian University           |                7 |           598,297 |          85471.00 |
| British Academy of Management           |                1 |            84,870 |          84870.00 |
| University of Wales Trinity St David    |                1 |           804,117 |         804117.00 |
| University of Hertfordshire             |               11 |           863,696 |          78517.82 |
| Bournemouth University                  |               11 |           845,749 |          76886.27 |
| University of Michigan                  |                3 |         2,240,913 |         746971.00 |
| University of East London               |               22 |         1,639,407 |          74518.50 |
| University of the Arts London           |                4 |           297,934 |          74483.50 |
| Birmingham City University              |                7 |           511,904 |          73129.14 |
| National Institute of Public Health     |                1 |           722,163 |         722163.00 |
| University of Bolton                    |                1 |            70,844 |          70844.00 |
| SAHFOS                                  |                1 |               700 |            700.00 |
| Aberystwyth University                  |               32 |         2,223,075 |          69471.09 |

### Funding by lead organisation for active projects only

This only shows the top 25 organisations with active projects by the
average value of the award.

| Org                                  | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------------------|-----------------:|------------------:|------------------:|
| Harvard University                   |                1 |            99,739 |          99739.00 |
| Canterbury Christ Church University  |                1 |            99,731 |          99731.00 |
| University of the Arts London        |                2 |           197,701 |          98850.50 |
| Birmingham City University           |                3 |           290,043 |          96681.00 |
| Manchester Metropolitan University   |               38 |         3,604,310 |          94850.26 |
| University of Derby                  |                2 |           187,847 |          93923.50 |
| University of East London            |               10 |            93,668 |           9366.80 |
| University of California, Berkeley   |                1 |            93,460 |          93460.00 |
| University of Surrey                 |               25 |        22,930,331 |         917213.24 |
| University of Brighton               |               38 |           342,106 |           9002.79 |
| Institute of Development Studies     |               13 |        11,640,314 |         895408.77 |
| Office for National Statistics       |                2 |        17,898,948 |        8949474.00 |
| Brunel University                    |               14 |         1,234,276 |          88162.57 |
| Institute for Fiscal Studies         |               19 |        16,400,339 |         863175.74 |
| University of St Andrews             |               26 |         2,149,900 |          82688.46 |
| University of Cape Town              |                4 |         3,264,723 |         816180.75 |
| University of Wales Trinity St David |                1 |           804,117 |         804117.00 |
| Open University                      |               37 |         2,950,128 |          79733.19 |
| University of Bradford               |                4 |           313,743 |          78435.75 |
| Cranfield University                 |                4 |         2,993,439 |         748359.75 |
| University of Plymouth               |                8 |           597,548 |          74693.50 |
| Goldsmiths College                   |               22 |         1,587,713 |          72168.77 |
| Washington University in St Louis    |                1 |           713,698 |         713698.00 |
| University of Michigan               |                1 |           697,241 |         697241.00 |
| University of Salford                |                2 |         1,384,158 |         692079.00 |

The same table ordered by the number of awards:

| Org                                  | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------------------|-----------------:|------------------:|------------------:|
| University College London            |              299 |       194,907,944 |         651866.03 |
| University of Oxford                 |              234 |        83,325,112 |         356090.22 |
| London School of Economics & Pol Sci |              224 |        78,281,421 |         349470.63 |
| Cardiff University                   |              221 |        57,730,832 |         261225.48 |
| King’s College London                |              216 |        57,064,736 |         264188.59 |
| University of Cambridge              |              210 |        43,301,780 |         206198.95 |
| University of Manchester             |              163 |        53,837,183 |         330289.47 |
| University of Sheffield              |              162 |        63,279,551 |         390614.51 |
| University of Leeds                  |              140 |        27,757,429 |         198267.35 |
| University of Southampton            |              140 |        50,057,303 |         357552.16 |
| University of Edinburgh              |              139 |        92,166,008 |         663064.81 |
| University of Bristol                |              134 |        64,005,811 |         477655.31 |
| University of Birmingham             |              133 |        18,524,190 |         139279.62 |
| University of Exeter                 |              128 |        17,303,084 |         135180.34 |
| University of Glasgow                |              126 |        42,004,979 |         333372.85 |
| Durham University                    |              121 |        31,044,809 |         256568.67 |
| University of Liverpool              |              113 |        54,090,187 |         478674.22 |
| Newcastle University                 |              110 |        24,667,367 |         224248.79 |
| Lancaster University                 |              106 |        26,024,426 |         245513.45 |
| University of Warwick                |               99 |        39,237,211 |         396335.46 |
| University of Nottingham             |               90 |        17,019,837 |         189109.30 |
| Queen Mary, University of London     |               85 |        10,693,466 |         125805.48 |
| University of York                   |               84 |        17,345,460 |         206493.57 |
| University of Bath                   |               80 |         9,464,088 |         118301.10 |
| University of Sussex                 |               70 |        38,201,879 |         545741.13 |

## Department awards

### Department awards for all projects

There are 1119 unique departments. The table below only shows
departments that have 30 or more occurrences. The Departments below have
been ‘cleaned’ to remove minor differences, e.g. Cardiff Business School
to Business School and so on.

| Department                             | Number | Percent | Total Awarded (£) |
|:---------------------------------------|-------:|--------:|------------------:|
| Psychology                             |    758 |    7.31 |       138,317,873 |
| Social Science                         |    553 |    5.33 |       201,168,618 |
| Geography                              |    408 |    3.93 |       132,462,745 |
| Economics                              |    367 |    3.54 |        92,568,798 |
| Education                              |    323 |    3.11 |        74,028,436 |
| Sociology                              |    275 |    2.65 |        72,731,454 |
| Law                                    |    261 |    2.52 |        40,351,547 |
| Business School                        |    246 |    2.37 |        94,230,663 |
| Politics                               |    194 |    1.87 |        22,914,127 |
| Management                             |    134 |    1.29 |        22,166,058 |
| Applied Social Science                 |    130 |    1.25 |        16,393,785 |
| Social and Political Science           |    129 |    1.24 |        60,233,521 |
| Anthropology                           |     96 |    0.93 |        12,181,407 |
| Sociology & Social Policy              |     89 |    0.86 |         7,105,171 |
| Politics and International Studies     |     82 |    0.79 |        23,157,580 |
| International Development              |     81 |    0.78 |        13,271,376 |
| Experimental Psychology                |     79 |    0.76 |        19,205,558 |
| Geography Politics and Sociology       |     79 |    0.76 |         7,353,442 |
| Environment, Education and Development |     78 |    0.75 |        23,049,547 |
| Health Science                         |     74 |    0.71 |        21,627,826 |
| Epidemiology and Public Health         |     74 |    0.71 |        23,143,895 |
| Social & Political Science             |     73 |    0.70 |        33,771,060 |
| History                                |     73 |    0.70 |         7,312,565 |
| Economic, Social & Political Sci       |     71 |    0.68 |        58,163,997 |
| IFS Research Team                      |     68 |    0.66 |        46,927,139 |
| Geography and Planning                 |     59 |    0.57 |         2,257,283 |
| Research Department                    |     56 |    0.54 |        21,966,197 |
| Policy Studies                         |     54 |    0.52 |        12,042,157 |
| Politics and International Relations   |     54 |    0.52 |         4,284,184 |
| Global Studies                         |     52 |    0.50 |        11,330,855 |
| Social and Economic Research           |     50 |    0.48 |       199,000,336 |
| Arts, Humanities & Social Sci          |     49 |    0.47 |                 0 |
| Psychological Science                  |     49 |    0.47 |         7,653,645 |
| Criminology                            |     45 |    0.43 |        19,815,492 |
| Health and Life Science                |     43 |    0.41 |         4,901,287 |
| Public Health and Policy               |     41 |    0.40 |        15,781,594 |
| Social and Policy Science              |     41 |    0.40 |         3,510,715 |
| Education and Professional Studies     |     38 |    0.37 |         5,906,044 |
| Philosophy Psychology & Language       |     38 |    0.37 |         8,674,195 |
| Government                             |     38 |    0.37 |         6,199,217 |
| Sociological Studies                   |     36 |    0.35 |         5,576,363 |
| War Studies                            |     36 |    0.35 |        21,706,313 |
| Linguistics and English Language       |     36 |    0.35 |         6,822,489 |
| Finance                                |     33 |    0.32 |         9,853,421 |
| Planning and Geography                 |     32 |    0.31 |         3,471,438 |
| Arts and Social Sci (FASS)             |     31 |    0.30 |         6,624,205 |
| Arts Languages and Cultures            |     31 |    0.30 |         2,974,941 |
| Social Pol Sociology & Social Res      |     30 |    0.29 |         3,390,023 |
| Politics & International Relation      |     30 |    0.29 |         8,072,909 |
| Geographical Science                   |     30 |    0.29 |         2,788,901 |

### Department awards for active projects only

There are 662 unique departments for active projects (1119 for all
projects). The table below only shows cases that have 30 or more
occurrences in active projects.

| Department                           | Number | Percent | Total Awarded (£) |
|:-------------------------------------|-------:|--------:|------------------:|
| Psychology                           |    369 |    7.46 |        56,245,872 |
| Social Science                       |    259 |    5.24 |       108,040,091 |
| Geography                            |    201 |    4.07 |        91,704,134 |
| Education                            |    177 |    3.58 |        42,643,897 |
| Economics                            |    169 |    3.42 |        38,105,729 |
| Sociology                            |    150 |    3.03 |        39,184,114 |
| Law                                  |    140 |    2.83 |        13,254,439 |
| Business School                      |    113 |    2.29 |        67,189,698 |
| Politics                             |    100 |    2.02 |         8,268,647 |
| Applied Social Science               |     78 |    1.58 |         8,704,044 |
| Sociology & Social Policy            |     60 |    1.21 |         2,536,700 |
| Anthropology                         |     56 |    1.13 |         2,759,406 |
| Management                           |     54 |    1.09 |         9,652,115 |
| Economic, Social & Political Sci     |     53 |    1.07 |        45,040,523 |
| Arts, Humanities & Social Sci        |     49 |    0.99 |                 0 |
| Geography Politics and Sociology     |     49 |    0.99 |         2,547,632 |
| History                              |     48 |    0.97 |         2,256,813 |
| Epidemiology and Public Health       |     44 |    0.89 |         9,484,655 |
| Health Science                       |     41 |    0.83 |         4,664,324 |
| Geography and Planning               |     40 |    0.81 |           708,622 |
| Social & Political Science           |     40 |    0.81 |        24,036,849 |
| Social and Political Science         |     39 |    0.79 |        42,150,481 |
| Experimental Psychology              |     36 |    0.73 |         5,288,082 |
| International Development            |     34 |    0.69 |         4,556,432 |
| Politics and International Relations |     31 |    0.63 |         1,725,275 |
| Politics and International Studies   |     30 |    0.61 |        15,045,532 |

## Doctoral Training Partnerships

### Active Partnerships

Currently active doctoral partnerships ordered by the start date.

| Lead Organisation                    | Department                              | Start    | End      |  Award (£) |
|:-------------------------------------|:----------------------------------------|:---------|:---------|-----------:|
| University College London            | Economics                               | 01/10/11 | 02/10/21 | 14,505,856 |
| University of Surrey                 | Psychology                              | 01/10/11 | 02/10/22 | 11,094,593 |
| University of Nottingham             | Research and Graduate Services          | 01/10/11 | 02/10/22 |  7,964,843 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/11 | 02/10/21 | 15,316,412 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/11 | 02/10/22 |  8,164,941 |
| University of Essex                  | Sociology                               | 01/10/11 | 02/10/22 |  7,884,208 |
| University of Sussex                 | Research and Enterprise Services        | 01/10/11 | 02/10/22 |  4,865,866 |
| University of Oxford                 | Social Sciences Division                | 01/10/11 | 02/10/22 | 19,130,626 |
| University College London            | Doctoral School                         | 01/10/11 | 02/10/22 | 12,927,461 |
| University of Cambridge              | Board of Graduate Studies               | 01/10/11 | 02/10/22 | 10,015,074 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/11 | 01/10/22 | 24,932,784 |
| King’s College London                | SSPP School Office                      | 01/10/11 | 31/03/22 |  7,150,273 |
| University of Bristol                | Research and Enterprise Development     | 01/10/11 | 02/10/21 | 17,563,914 |
| University of Edinburgh              | Sch of Social and Political Science     | 01/10/11 | 02/10/21 | 27,538,201 |
| Durham University                    | Archaeology                             | 01/10/11 | 30/09/23 | 11,794,305 |
| Queen Mary, University of London     | English                                 | 01/10/11 | 02/10/21 |  5,087,223 |
| Cardiff University                   | Registry                                | 01/10/11 | 02/10/22 | 14,946,728 |
| University of Birmingham             | The Registrar                           | 01/10/11 | 02/04/22 |  6,277,485 |
| University of Sheffield              | Geography                               | 01/10/11 | 02/10/22 | 21,107,576 |
| University of Warwick                | Politics and International Studies      | 03/10/11 | 02/04/22 | 12,411,023 |
| London Business School               | Research and Faculty Office             | 01/08/17 | 02/10/21 |    346,071 |
| University of Bristol                | Education                               | 01/10/17 | 30/09/27 | 17,756,940 |
| University of Cambridge              | Criminology                             | 01/10/17 | 30/09/27 | 12,988,673 |
| University of Leeds                  | Sch of Geography                        | 01/10/17 | 30/09/24 |  2,346,732 |
| University College London            | Epidemiology and Public Health          | 01/10/17 | 30/09/24 |  2,154,131 |
| University of Edinburgh              | Sch of Geosciences                      | 01/10/17 | 30/09/27 | 17,392,901 |
| University College London            | Doctoral School                         | 01/10/17 | 30/09/27 | 18,280,789 |
| University of Essex                  | Registry                                | 01/10/17 | 30/09/27 | 11,813,676 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/17 | 30/09/27 | 17,857,544 |
| University of Oxford                 | Social Sciences Division                | 01/10/17 | 30/09/27 | 12,256,023 |
| Durham University                    | Geography                               | 01/10/17 | 30/09/27 | 11,156,304 |
| Cardiff University                   | Sch of Social Sciences                  | 01/10/17 | 30/09/27 | 13,588,999 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/17 | 30/09/27 | 11,976,473 |
| University of Warwick                | Sociology                               | 01/10/17 | 30/09/27 | 12,497,302 |
| University of Sheffield              | Geography                               | 01/10/17 | 30/09/27 | 15,429,313 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/17 | 30/09/27 | 14,988,643 |
| University of the West of England    | Faculty of Health and Life Sciences     | 01/10/20 | 01/10/24 |          0 |
| University College London            | Epidemiology and Public Health          | 01/10/20 | 30/09/26 |  1,453,720 |

## Award Titles

### Active award titles

A word cloud made from the award titles using the top 250 words thogh
some of the longer words have been excluded.

![](ESRC_files/figure-gfm/ActiveWordCloud-1.png)<!-- -->

## Classification by category

Classify the department of the Principal Investigator (assuming that the
department will be linked to the subject of the award) using the
following base categories:

-   Area Studies
-   Demography
-   Development studies
-   Economics
-   Education
-   Environmental planning
-   History
-   Human Geography
-   Law & legal studies
-   Linguistics
-   Management & business studies
-   Political science. & international studies
-   Psychology
-   Science and Technology Studies
-   Social anthropology
-   Social policy
-   Social work
-   Sociology
-   Tools, technologies & methods
-   Other

The categories are derived from decomposition of previous ESRC
expenditure reports at [ESRC application and success rate data and
analysis](https://www.ukri.org/publications/esrc-application-and-success-rate-data-and-analysis/).
The GtR subject classification for projects has been mapped to the above
scheme and where a project subject is not provided an “Unclassified”
type is used.

There are 73 subject types and 21 categories described above plus the
`Uncategorised` type for the cases where this information has not been
provided. The GtR subjects for ESRC projects have been mapped to
categories according to:

-   **Area Studies**: Area Studies
-   **Demography**: Demography, Demography & human geography
-   **Development studies**: Development studies
-   **Economics**: Economics
-   **Education**: Education
-   **Environmental planning**: Environmental planning
-   **History**: History
-   **Human Geography**: Human Geography
-   **Law & legal studies**: Law & legal studies
-   **Linguistics**: Linguistics, Languages & Literature
-   **Management & business studies**: Management & Business Studies
-   **Political science. & international studies**: Pol. sci. &
    internat. studies
-   **Psychology**: Psychology
-   **Science and Technology Studies**: Science and Technology Studies
-   **Social anthropology**: Social Anthropology
-   **Social policy**: Social Policy
-   **Social work**: Social Work
-   **Sociology**: Sociology
-   **Tools, technologies & methods**: “Tools, technologies & methods”
-   **Other**: RCUK Programmes, Genetics & development, Climate &
    Climate Change, Media, “Ecol, biodivers. & systematics”, Civil eng.
    & built environment, Info. & commun. Technol., Medical & health
    interface, Visual arts, Design, Complexity Science, “Pollution,
    waste & resources”, Terrest. & freshwater environ.,
    Agri-environmental science, Food science & nutrition, Environmental
    Engineering, Manufacturing, Drama & theatre studies, Cultural &
    museum studies, Philosophy, Animal Science, Energy, Mathematical
    sciences, Archaeology, Music, “Theology, divinity & religion”,
    Library & information studies, Astronomy - observation, Astronomy -
    theory, Particle Astrophysics, Bioengineering, Cell biology, Process
    engineering, Omic sciences & technologies, Systems engineering,
    Marine environments, Atmospheric phys. & chemistry, Plant & crop
    science, Electrical Engineering, Dance, Chemical measurement,
    Geosciences, Microbial sciences, Mechanical Engineering, Classics,
    Catalysis & surfaces, Materials sciences, Instrument. sensor &
    detectors, Materials Processing
-   **Uncategorised**: NA

A project might be assigned more than one subject, where this is the
case if the project has been assigned with n subjects then each will
contribute 1/n to the classification count and wil be assigned a
contribution of Award_amount/n to each subject. Taking this into account
for each project, this gives a breakdown of the number of awards and
amount awarded as:

| Category                                   | Number of awards | Number % | Award (£)   | Award % |
|:-------------------------------------------|:-----------------|:---------|:------------|:--------|
| Uncategorised                              | 4,277.0          | 41       | 661,431,925 | 20      |
| Other                                      | 604.7            | 6        | 383,745,803 | 12      |
| Economics                                  | 526.6            | 5        | 338,799,625 | 10      |
| Sociology                                  | 743.6            | 7        | 285,194,282 | 9       |
| Psychology                                 | 799.3            | 8        | 246,376,376 | 8       |
| Social policy                              | 392.1            | 4        | 203,999,345 | 6       |
| Political science. & international studies | 495.9            | 5        | 136,527,673 | 4       |
| Education                                  | 323.8            | 3        | 134,694,744 | 4       |
| Development studies                        | 311.0            | 3        | 127,563,704 | 4       |
| Human Geography                            | 234.1            | 2        | 122,727,321 | 4       |
| Management & business studies              | 360.5            | 3        | 116,195,854 | 4       |
| Tools, technologies & methods              | 198.4            | 2        | 109,860,096 | 3       |
| Demography                                 | 216.6            | 2        | 106,195,991 | 3       |
| Law & legal studies                        | 191.2            | 2        | 54,172,169  | 2       |
| Linguistics                                | 168.1            | 2        | 48,297,137  | 1       |
| Social anthropology                        | 157.7            | 2        | 45,561,198  | 1       |
| History                                    | 103.4            | 1        | 33,589,332  | 1       |
| Social work                                | 82.9             | 1        | 30,099,764  | 1       |
| Environmental planning                     | 83.6             | 1        | 26,536,290  | 1       |
| Science and Technology Studies             | 60.3             | 1        | 23,625,071  | 1       |
| Area Studies                               | 42.0             | 0        | 13,558,534  | 0       |

The `Other` category dominates by award amount though the
`Uncategorised` dominate by numbers. Looking at the `Other` category in
more detail:

| Subject                        | Number of awards | Number % | Award (£)      | Award % |
|:-------------------------------|:-----------------|:---------|:---------------|:--------|
| RCUK Programmes                | 155.0            | 26       | 123,439,927.26 | 32      |
| Medical & health interface     | 107.2            | 18       | 82,260,150.32  | 21      |
| Info. & commun. Technol.       | 50.7             | 8        | 27,019,172.20  | 7       |
| Genetics & development         | 9.9              | 2        | 21,599,697.88  | 6       |
| Civil eng. & built environment | 26.4             | 4        | 15,091,926.39  | 4       |
| Climate & Climate Change       | 18.3             | 3        | 11,644,688.42  | 3       |
| Mathematical sciences          | 16.1             | 3        | 10,307,418.49  | 3       |
| Design                         | 19.1             | 3        | 8,148,979.46   | 2       |
| Visual arts                    | 17.1             | 3        | 7,234,559.47   | 2       |
| Library & information studies  | 2.2              | 0        | 6,869,187.65   | 2       |
| Media                          | 27.2             | 5        | 6,753,037.07   | 2       |
| Agri-environmental science     | 12.3             | 2        | 6,737,178.83   | 2       |
| Energy                         | 13.6             | 2        | 6,672,216.80   | 2       |
| Animal Science                 | 17.8             | 3        | 6,144,659.74   | 2       |
| Complexity Science             | 8.6              | 1        | 5,451,662.50   | 1       |
| Ecol, biodivers. & systematics | 7.5              | 1        | 5,144,719.31   | 1       |
| Food science & nutrition       | 14.5             | 2        | 4,981,417.06   | 1       |
| Philosophy                     | 14.7             | 2        | 4,239,294.46   | 1       |
| Theology, divinity & religion  | 7.0              | 1        | 3,518,954.19   | 1       |
| Cultural & museum studies      | 15.3             | 3        | 2,820,192.63   | 1       |
| Environmental Engineering      | 2.2              | 0        | 2,403,605.88   | 1       |
| Pollution, waste & resources   | 4.8              | 1        | 2,105,474.31   | 1       |
| Terrest. & freshwater environ. | 2.9              | 0        | 1,809,238.00   | 0       |
| Microbial sciences             | 1.7              | 0        | 1,280,770.64   | 0       |
| Mechanical Engineering         | 1.0              | 0        | 1,258,921.07   | 0       |
| Manufacturing                  | 5.7              | 1        | 1,198,467.70   | 0       |
| Drama & theatre studies        | 3.8              | 1        | 1,021,262.05   | 0       |
| Bioengineering                 | 1.2              | 0        | 795,586.51     | 0       |
| Marine environments            | 1.9              | 0        | 751,153.37     | 0       |
| Omic sciences & technologies   | 1.5              | 0        | 684,902.92     | 0       |
| Music                          | 4.5              | 1        | 658,680.39     | 0       |
| Atmospheric phys. & chemistry  | 0.4              | 0        | 577,551.45     | 0       |
| Systems engineering            | 1.2              | 0        | 555,601.57     | 0       |
| Geosciences                    | 2.5              | 0        | 536,919.14     | 0       |
| Electrical Engineering         | 2.4              | 0        | 507,161.59     | 0       |
| Cell biology                   | 0.7              | 0        | 286,269.60     | 0       |
| Archaeology                    | 1.3              | 0        | 206,572.00     | 0       |
| Materials Processing           | 0.3              | 0        | 204,640.82     | 0       |
| Classics                       | 0.3              | 0        | 201,333.46     | 0       |
| Plant & crop science           | 0.2              | 0        | 175,269.20     | 0       |
| Dance                          | 1.0              | 0        | 152,404.00     | 0       |
| Materials sciences             | 0.8              | 0        | 81,695.26      | 0       |
| Process engineering            | 0.8              | 0        | 67,583.81      | 0       |
| Astronomy - observation        | 0.2              | 0        | 38,559.00      | 0       |
| Astronomy - theory             | 0.2              | 0        | 38,559.00      | 0       |
| Particle Astrophysics          | 0.2              | 0        | 38,559.00      | 0       |
| Catalysis & surfaces           | 0.2              | 0        | 30,020.75      | 0       |

There are some large items near the top. Also, some of the items would
not usually fall under the ESRC area.

If we only focus on currently active projects we get:

| Category                                   | Number of awards | Number % | Award (£)   | Award % |
|:-------------------------------------------|:-----------------|:---------|:------------|:--------|
| Uncategorised                              | 3,478.0          | 70       | 523,234,670 | 30      |
| Other                                      | 230.1            | 5        | 272,994,283 | 15      |
| Economics                                  | 122.1            | 2        | 157,322,573 | 9       |
| Sociology                                  | 166.2            | 3        | 114,551,889 | 6       |
| Social policy                              | 102.2            | 2        | 110,135,170 | 6       |
| Psychology                                 | 173.2            | 4        | 84,502,509  | 5       |
| Human Geography                            | 93.8             | 2        | 80,545,321  | 5       |
| Development studies                        | 67.7             | 1        | 65,876,212  | 4       |
| Education                                  | 75.1             | 2        | 58,132,386  | 3       |
| Management & business studies              | 65.9             | 1        | 55,405,705  | 3       |
| Political science. & international studies | 99.9             | 2        | 50,626,694  | 3       |
| Demography                                 | 17.1             | 0        | 49,879,926  | 3       |
| Tools, technologies & methods              | 27.4             | 1        | 30,126,581  | 2       |
| Law & legal studies                        | 46.8             | 1        | 24,494,514  | 1       |
| Social work                                | 24.9             | 1        | 17,608,512  | 1       |
| Social anthropology                        | 40.2             | 1        | 17,547,416  | 1       |
| Science and Technology Studies             | 25.6             | 1        | 14,166,210  | 1       |
| Environmental planning                     | 17.8             | 0        | 12,736,827  | 1       |
| Linguistics                                | 31.6             | 1        | 11,638,437  | 1       |
| Area Studies                               | 18.8             | 0        | 8,353,914   | 0       |
| History                                    | 19.3             | 0        | 6,413,233   | 0       |

and again looking to see how the `Other` category breakdown for active
projects only:

| Subject                        | Number of awards | Number % | Award (£)      | Award % |
|:-------------------------------|:-----------------|:---------|:---------------|:--------|
| RCUK Programmes                | 42.9             | 19       | 105,591,657.39 | 39      |
| Medical & health interface     | 46.1             | 20       | 56,438,591.83  | 21      |
| Info. & commun. Technol.       | 23.6             | 10       | 15,673,625.62  | 6       |
| Genetics & development         | 1.1              | 0        | 13,234,159.47  | 5       |
| Civil eng. & built environment | 10.2             | 4        | 10,410,176.88  | 4       |
| Climate & Climate Change       | 6.9              | 3        | 7,680,351.48   | 3       |
| Library & information studies  | 0.2              | 0        | 6,264,545.60   | 2       |
| Visual arts                    | 10.7             | 5        | 6,060,247.73   | 2       |
| Mathematical sciences          | 4.9              | 2        | 5,520,091.14   | 2       |
| Design                         | 9.4              | 4        | 5,128,469.20   | 2       |
| Energy                         | 6.1              | 3        | 5,008,606.58   | 2       |
| Agri-environmental science     | 3.8              | 2        | 4,094,839.53   | 1       |
| Media                          | 10.2             | 4        | 3,903,650.83   | 1       |
| Ecol, biodivers. & systematics | 3.3              | 1        | 3,793,801.73   | 1       |
| Food science & nutrition       | 5.9              | 3        | 2,455,105.23   | 1       |
| Theology, divinity & religion  | 2.4              | 1        | 2,450,914.54   | 1       |
| Animal Science                 | 4.8              | 2        | 2,434,490.92   | 1       |
| Environmental Engineering      | 1.8              | 1        | 2,390,817.38   | 1       |
| Complexity Science             | 3.8              | 2        | 1,884,220.46   | 1       |
| Pollution, waste & resources   | 2.1              | 1        | 1,630,963.38   | 1       |
| Terrest. & freshwater environ. | 1.6              | 1        | 1,471,464.70   | 1       |
| Philosophy                     | 4.1              | 2        | 1,242,766.84   | 0       |
| Cultural & museum studies      | 6.6              | 3        | 1,233,008.15   | 0       |
| Drama & theatre studies        | 2.5              | 1        | 874,282.45     | 0       |
| Bioengineering                 | 0.7              | 0        | 756,400.51     | 0       |
| Microbial sciences             | 0.5              | 0        | 755,576.74     | 0       |
| Manufacturing                  | 2.7              | 1        | 707,405.79     | 0       |
| Atmospheric phys. & chemistry  | 0.4              | 0        | 577,551.45     | 0       |
| Electrical Engineering         | 2.2              | 1        | 501,733.79     | 0       |
| Systems engineering            | 0.9              | 0        | 489,079.07     | 0       |
| Music                          | 2.0              | 1        | 423,270.72     | 0       |
| Geosciences                    | 0.9              | 0        | 359,453.36     | 0       |
| Marine environments            | 1.0              | 0        | 330,669.02     | 0       |
| Cell biology                   | 0.7              | 0        | 286,269.60     | 0       |
| Omic sciences & technologies   | 0.8              | 0        | 206,730.20     | 0       |
| Materials Processing           | 0.3              | 0        | 204,640.82     | 0       |
| Classics                       | 0.3              | 0        | 201,333.46     | 0       |
| Plant & crop science           | 0.2              | 0        | 175,269.20     | 0       |
| Mechanical Engineering         | 0.8              | 0        | 113,810.07     | 0       |
| Process engineering            | 0.3              | 0        | 31,770.86      | 0       |
| Archaeology                    | 0.2              | 0        | 2,469.50       | 0       |

Ignoring the `Other` and `Uncategorised` categories and considering only
active projects:

| Category                                   | Number of awards | Number % | Award (£)   | Award % |
|:-------------------------------------------|:-----------------|:---------|:------------|:--------|
| Economics                                  | 122.1            | 10       | 157,322,573 | 16      |
| Sociology                                  | 166.2            | 13       | 114,551,889 | 12      |
| Social policy                              | 102.2            | 8        | 110,135,170 | 11      |
| Psychology                                 | 173.2            | 14       | 84,502,509  | 9       |
| Human Geography                            | 93.8             | 8        | 80,545,321  | 8       |
| Development studies                        | 67.7             | 5        | 65,876,212  | 7       |
| Education                                  | 75.1             | 6        | 58,132,386  | 6       |
| Management & business studies              | 65.9             | 5        | 55,405,705  | 6       |
| Political science. & international studies | 99.9             | 8        | 50,626,694  | 5       |
| Demography                                 | 17.1             | 1        | 49,879,926  | 5       |
| Tools, technologies & methods              | 27.4             | 2        | 30,126,581  | 3       |
| Law & legal studies                        | 46.8             | 4        | 24,494,514  | 3       |
| Social work                                | 24.9             | 2        | 17,608,512  | 2       |
| Social anthropology                        | 40.2             | 3        | 17,547,416  | 2       |
| Science and Technology Studies             | 25.6             | 2        | 14,166,210  | 1       |
| Environmental planning                     | 17.8             | 1        | 12,736,827  | 1       |
| Linguistics                                | 31.6             | 3        | 11,638,437  | 1       |
| Area Studies                               | 18.8             | 2        | 8,353,914   | 1       |
| History                                    | 19.3             | 2        | 6,413,233   | 1       |

![](ESRC_files/figure-gfm/AwardPiePlot-1.png)<!-- -->

![](ESRC_files/figure-gfm/NumberOfAwardsPiePlot-1.png)<!-- --> \# ToDo
Items

-   [ ] Reconcile DTPs from what was scraped from the [ESRC
    DTP](https://esrc.ukri.org/skills-and-careers/doctoral-training/doctoral-training-partnerships/doctoral-training-partnership-dtp-contacts/)
    web page and what is in the GtR data file (there are more).
-   [ ] Research title looks interesting for further examination but
    will require processing to be comprehensible.
