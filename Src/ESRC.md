Economic and Social Research Council (ESRC) Data
================
**Author**: Mario Antonioletti.<br/>
**Last updated**: 07/03/22.

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

The aim of this document is to provide an overview of expenditure done
of the [United Kingdom Research and Innovation](https://www.ukri.org/)
(UKRI) ESRC as determined from a [Gateway to
Research](https://gtr.ukri.org/) (GtR) data snapshot. The data is made
available under an [Open Government
Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/),
and covers the period 01/01/73 to 01/01/30. The GtR data snapshot
corresponded to data last updated by UKRI on the 24th February 2022.

The R markdown that generated this analysis is available at:

-   <https://github.com/softwaresaved/esrc-software-study/blob/main/Src/ESRC.Rmd>

The data set contains 128,238 rows (after some data cleaning), where a
row corresponds to the record of an award. In this data set 11,598
correspond to ESRC awards.

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

Although strictly speaking it was the *Social Science Research Council*
(SSRC) that came into being in 1965 and it was not until 1983 that the
SSRC was renamed the Economic and Social Research Council (ESRC).

# Overall expenditure

We start by doing a brief overview of all the data obtained from the
Gateway to Research before we focus on the ESRC data.

## Expenditure for all UKRI projects

Expenditure for the whole period under consideration is shown in the
graph below. Awards that do not have a value defined have been removed.

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

The number of awards given by each council:

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

The graph with the values scaled:

<img src="ESRC_files/figure-gfm/AwardDistrPerFundCouncilScaled-1.png" title="Distribution of award size by research council with the graphs scaled." alt="Distribution of award size by research council with the graphs scaled."  />

Expenditure by year using the starting year of the award for funds
allocated that year per research council:

<img src="ESRC_files/figure-gfm/funding_ByOrgByYear-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

<img src="ESRC_files/figure-gfm/funding_ByOrgByYearPer-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

### Summary

-   Over the time covered by the data, EPSRC has been allocated the most
    money but they also give the most awards so on average they do not
    give the highest award.
-   The MRC have been given the third highest amount but, other than
    UKRI, they give the second highest average award.
-   Of interest to this particular study the ESRC comes in fifth in the
    total amount awarded and they give the fourth highest number of
    awards so their average over the research councils comes third.

## Expenditure for active UKRI projects only

The graph below only contains values for currently active projects:

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

With the densities scaled:

<img src="ESRC_files/figure-gfm/ActiveAwardDistrPerFundCouncilScaled-1.png" title="Distribution of award size by research council for active projects with the graphs scaled." alt="Distribution of award size by research council for active projects with the graphs scaled."  />

Expenditure by year using the starting year of the award for funds
allocated that year per research council for active projects:

<img src="ESRC_files/figure-gfm/funding_ByOrgByYearAct-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

<img src="ESRC_files/figure-gfm/funding_ByOrgByYearActPer-1.png" title="Expenditure across each UKRI council from the available data by year." alt="Expenditure across each UKRI council from the available data by year."  />

# ESRC data

## Project category awards

### All projects category awards

The project categories for the ESRC awards covering the period 01/01/06
to 30/09/29. No explicit data seems to be provided for *Studentships*.
Data is sorted by the average award.

| Project Catgeory | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-----------------|-----------------:|------------------:|------------------:|
| Research Grant   |            6,112 |     2,773,237,214 |         453736.46 |
| Training Grant   |              403 |       574,573,855 |        1425741.58 |
| Fellowship       |            1,434 |       153,341,953 |         106933.02 |
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
| Unknown                  |            3,864 |     1,134,062,731 |         293494.50 |
| London                   |            1,671 |       461,842,582 |         276386.94 |
| South East               |            1,639 |       424,296,552 |         258875.26 |
| East of England          |              211 |       351,069,242 |        1663835.27 |
| Scotland                 |            1,172 |       334,226,244 |         285175.98 |
| North West               |              793 |       206,831,592 |         260821.68 |
| South West               |              570 |       145,368,501 |         255032.46 |
| West Midlands            |              412 |       117,187,816 |         284436.45 |
| East Midlands            |              435 |        88,354,612 |         203114.05 |
| Wales                    |              216 |        77,994,514 |         361085.71 |
| Yorkshire and The Humber |              324 |        55,799,858 |         172221.78 |
| Northern Ireland         |              156 |        55,209,650 |         353908.01 |
| Outside UK               |               87 |        42,660,826 |         490354.32 |
| North East               |               46 |         5,720,679 |         124362.59 |
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
| University of Copenhagen                |                1 |            97,614 |          97614.00 |
| NERC British Geological Survey          |                1 |             9,753 |           9753.00 |
| University of the West of Scotland      |                5 |           473,006 |          94601.20 |
| University of Cape Town                 |                6 |         5,670,678 |         945113.00 |
| University of the West of England       |               51 |         4,717,707 |          92504.06 |
| Canterbury Christ Church University     |                2 |           181,236 |          90618.00 |
| Manchester Metropolitan University      |               67 |         5,998,762 |          89533.76 |
| Office for National Statistics          |                2 |        17,898,948 |        8949474.00 |
| University of the Highlands and Islands |                3 |           264,465 |          88155.00 |
| Quadram Institute Bioscience            |                1 |            87,062 |          87062.00 |
| Johns Hopkins University                |                1 |           865,561 |         865561.00 |
| University of Huddersfield              |               11 |           950,591 |          86417.36 |
| University of Hertfordshire             |               14 |         1,136,235 |          81159.64 |
| University of Wales Trinity St David    |                1 |           804,117 |         804117.00 |
| Aberystwyth University                  |               37 |         2,830,742 |          76506.54 |
| University of Michigan                  |                3 |         2,240,913 |         746971.00 |
| University of the Arts London           |                4 |           297,934 |          74483.50 |
| National Institute of Public Health     |                1 |           722,163 |         722163.00 |
| Birmingham City University              |                8 |           577,158 |          72144.75 |
| University of Hull                      |               45 |         3,241,152 |          72025.60 |
| University of East London               |               24 |         1,721,019 |          71709.12 |
| Bournemouth University                  |               12 |           855,831 |          71319.25 |
| Institute of Development Studies        |               36 |        25,506,408 |         708511.33 |
| University of Bolton                    |                1 |            70,844 |          70844.00 |
| SAHFOS                                  |                1 |               700 |            700.00 |

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

There are 1193 unique departments. The table below only shows
departments that have 30 or more occurrences. The Departments below have
been ‘cleaned’ to remove minor differences, e.g. Cardiff Business School
to Business School and so on.

| Department                              | Number | Percent | Total Awarded (£) |
|:----------------------------------------|-------:|--------:|------------------:|
| Psychology                              |    900 |    7.76 |       157,057,277 |
| Social Science                          |    613 |    5.29 |       211,559,770 |
| Geography                               |    461 |    3.97 |       141,559,264 |
| Economics                               |    442 |    3.81 |       104,120,091 |
| Education                               |    362 |    3.12 |        80,037,535 |
| Sociology                               |    305 |    2.63 |        78,900,111 |
| Law                                     |    274 |    2.36 |        49,478,411 |
| Business School                         |    270 |    2.33 |       102,424,723 |
| Politics                                |    217 |    1.87 |        25,418,624 |
| Social and Political Science            |    153 |    1.32 |        63,475,942 |
| Management                              |    150 |    1.29 |        23,519,136 |
| Applied Social Science                  |    141 |    1.22 |        17,468,953 |
| Anthropology                            |    109 |    0.94 |        14,001,257 |
| Experimental Psychology                 |     99 |    0.85 |        22,121,224 |
| Sociology & Social Policy               |     94 |    0.81 |        11,305,140 |
| Politics and International Studies      |     94 |    0.81 |        24,352,975 |
| International Development               |     89 |    0.77 |        14,311,022 |
| Geography Politics and Sociology        |     87 |    0.75 |         8,025,009 |
| Environment, Education and Development  |     86 |    0.74 |        24,263,499 |
| Social & Political Science              |     83 |    0.72 |        37,683,118 |
| History                                 |     82 |    0.71 |         8,271,728 |
| Health Science                          |     79 |    0.68 |        22,207,732 |
| Epidemiology and Public Health          |     77 |    0.66 |        23,441,020 |
| IFS Research Team                       |     76 |    0.66 |        51,097,083 |
| Economic, Social & Political Sci        |     71 |    0.61 |        58,163,997 |
| Research Department                     |     67 |    0.58 |        27,588,126 |
| Psychological Science                   |     64 |    0.55 |         9,177,714 |
| Politics and International Relations    |     61 |    0.53 |         4,890,554 |
| Geography and Planning                  |     60 |    0.52 |         2,315,174 |
| Policy Studies                          |     59 |    0.51 |        12,709,461 |
| Global Studies                          |     56 |    0.48 |        11,758,682 |
| Social and Economic Research            |     55 |    0.47 |       199,533,399 |
| Health and Life Science                 |     49 |    0.42 |         5,496,272 |
| Arts, Humanities & Social Sci           |     49 |    0.42 |                 0 |
| Criminology                             |     48 |    0.41 |        22,873,570 |
| Government                              |     47 |    0.41 |         6,983,337 |
| Philosophy Psychology & Language        |     47 |    0.41 |        10,023,375 |
| Unlisted                                |     45 |    0.39 |         4,878,100 |
| Public Health and Policy                |     44 |    0.38 |        15,936,964 |
| Social and Policy Science               |     44 |    0.38 |         3,718,498 |
| Education and Professional Studies      |     41 |    0.35 |         7,147,045 |
| War Studies                             |     40 |    0.34 |        22,376,656 |
| Linguistics and English Language        |     40 |    0.34 |        12,876,502 |
| Sociological Studies                    |     36 |    0.31 |         5,576,363 |
| Planning and Geography                  |     36 |    0.31 |         4,486,429 |
| Arts Languages and Cultures             |     35 |    0.30 |         3,272,010 |
| Finance                                 |     34 |    0.29 |        11,313,590 |
| Leeds University Business School (LUBS) |     33 |    0.28 |         4,581,168 |
| Social Pol Sociology & Social Res       |     32 |    0.28 |         3,551,396 |
| Politics & International Relation       |     32 |    0.28 |         8,133,864 |
| Social Policy                           |     32 |    0.28 |         4,424,327 |
| Arts and Social Sci (FASS)              |     31 |    0.27 |         6,624,205 |
| Epidemiology and Population Health      |     31 |    0.27 |         6,422,547 |
| Geographical Science                    |     31 |    0.27 |         2,822,791 |
| Social Anthropology                     |     30 |    0.26 |         4,212,208 |
| Economic Performance                    |     30 |    0.26 |        31,240,968 |

### Department awards for active projects only

There are 662 unique departments for active projects (1193 for all
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
| Uncategorised                              | 4,371.0          | 38       | 687,544,897 | 20      |
| Other                                      | 594.2            | 5        | 382,159,475 | 11      |
| Economics                                  | 637.0            | 5        | 357,290,793 | 10      |
| Sociology                                  | 893.4            | 8        | 317,472,941 | 9       |
| Psychology                                 | 1,002.3          | 9        | 274,941,009 | 8       |
| Social policy                              | 455.5            | 4        | 213,401,189 | 6       |
| Political science. & international studies | 593.2            | 5        | 150,166,125 | 4       |
| Education                                  | 404.4            | 3        | 149,107,165 | 4       |
| Development studies                        | 354.3            | 3        | 140,307,912 | 4       |
| Management & business studies              | 427.8            | 4        | 132,403,634 | 4       |
| Tools, technologies & methods              | 249.2            | 2        | 131,290,878 | 4       |
| Demography                                 | 310.9            | 3        | 123,839,627 | 4       |
| Human Geography                            | 230.3            | 2        | 121,043,925 | 3       |
| Linguistics                                | 208.0            | 2        | 59,793,504  | 2       |
| Social anthropology                        | 207.7            | 2        | 57,527,621  | 2       |
| Law & legal studies                        | 215.1            | 2        | 55,447,256  | 2       |
| History                                    | 139.1            | 1        | 40,842,776  | 1       |
| Environmental planning                     | 114.7            | 1        | 39,250,443  | 1       |
| Social work                                | 88.9             | 1        | 30,921,156  | 1       |
| Science and Technology Studies             | 58.7             | 1        | 22,544,127  | 1       |
| Area Studies                               | 41.0             | 0        | 13,496,626  | 0       |

The `Other` category dominates by award amount though the
`Uncategorised` dominate by numbers. Looking at the `Other` category in
more detail:

| Subject                        | Number of awards | Number % | Award (£)      | Award % |
|:-------------------------------|:-----------------|:---------|:---------------|:--------|
| RCUK Programmes                | 155.0            | 26       | 123,439,927.26 | 32      |
| Medical & health interface     | 106.5            | 18       | 82,182,603.94  | 22      |
| Info. & commun. Technol.       | 48.5             | 8        | 25,926,584.20  | 7       |
| Genetics & development         | 9.9              | 2        | 21,599,697.88  | 6       |
| Civil eng. & built environment | 25.4             | 4        | 15,031,089.01  | 4       |
| Climate & Climate Change       | 17.8             | 3        | 11,621,809.92  | 3       |
| Mathematical sciences          | 16.1             | 3        | 10,307,418.49  | 3       |
| Design                         | 18.8             | 3        | 8,138,558.46   | 2       |
| Visual arts                    | 15.4             | 3        | 7,164,430.77   | 2       |
| Library & information studies  | 2.2              | 0        | 6,869,187.65   | 2       |
| Agri-environmental science     | 12.3             | 2        | 6,737,178.83   | 2       |
| Media                          | 26.2             | 4        | 6,710,051.26   | 2       |
| Energy                         | 12.7             | 2        | 6,600,896.93   | 2       |
| Animal Science                 | 17.5             | 3        | 6,129,281.47   | 2       |
| Complexity Science             | 8.6              | 1        | 5,451,662.50   | 1       |
| Ecol, biodivers. & systematics | 7.5              | 1        | 5,144,719.31   | 1       |
| Food science & nutrition       | 14.5             | 2        | 4,981,417.06   | 1       |
| Philosophy                     | 14.7             | 2        | 4,239,294.46   | 1       |
| Theology, divinity & religion  | 7.0              | 1        | 3,518,954.19   | 1       |
| Cultural & museum studies      | 13.8             | 2        | 2,752,950.93   | 1       |
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
| Music                          | 4.3              | 1        | 649,682.19     | 0       |
| Atmospheric phys. & chemistry  | 0.4              | 0        | 577,551.45     | 0       |
| Geosciences                    | 2.5              | 0        | 536,919.14     | 0       |
| Systems engineering            | 1.0              | 0        | 509,597.37     | 0       |
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
| Uncategorised                              | 3,545.0          | 72       | 545,163,752 | 31      |
| Other                                      | 219.5            | 4        | 271,407,955 | 15      |
| Economics                                  | 117.7            | 2        | 153,890,034 | 9       |
| Sociology                                  | 160.7            | 3        | 112,617,367 | 6       |
| Social policy                              | 95.6             | 2        | 109,299,745 | 6       |
| Psychology                                 | 166.2            | 3        | 82,113,774  | 5       |
| Human Geography                            | 90.0             | 2        | 78,861,925  | 4       |
| Development studies                        | 64.8             | 1        | 65,592,728  | 4       |
| Education                                  | 73.7             | 1        | 57,988,345  | 3       |
| Management & business studies              | 62.8             | 1        | 53,124,945  | 3       |
| Demography                                 | 17.1             | 0        | 49,879,926  | 3       |
| Political science. & international studies | 97.1             | 2        | 48,290,520  | 3       |
| Tools, technologies & methods              | 25.0             | 1        | 29,752,678  | 2       |
| Law & legal studies                        | 43.5             | 1        | 22,174,153  | 1       |
| Social anthropology                        | 40.0             | 1        | 17,537,490  | 1       |
| Social work                                | 20.3             | 0        | 17,180,172  | 1       |
| Science and Technology Studies             | 24.0             | 0        | 13,085,266  | 1       |
| Environmental planning                     | 16.3             | 0        | 12,565,266  | 1       |
| Linguistics                                | 28.2             | 1        | 11,105,649  | 1       |
| Area Studies                               | 17.8             | 0        | 8,292,006   | 0       |
| History                                    | 18.4             | 0        | 6,370,477   | 0       |

and again looking to see how the `Other` category breakdown for active
projects only:

| Subject                        | Number of awards | Number % | Award (£)      | Award % |
|:-------------------------------|:-----------------|:---------|:---------------|:--------|
| RCUK Programmes                | 42.9             | 20       | 105,591,657.39 | 39      |
| Medical & health interface     | 45.4             | 21       | 56,361,045.45  | 21      |
| Info. & commun. Technol.       | 21.3             | 10       | 14,581,037.62  | 5       |
| Genetics & development         | 1.1              | 1        | 13,234,159.47  | 5       |
| Civil eng. & built environment | 9.1              | 4        | 10,349,339.50  | 4       |
| Climate & Climate Change       | 6.4              | 3        | 7,657,472.98   | 3       |
| Library & information studies  | 0.2              | 0        | 6,264,545.60   | 2       |
| Visual arts                    | 9.0              | 4        | 5,990,119.03   | 2       |
| Mathematical sciences          | 4.9              | 2        | 5,520,091.14   | 2       |
| Design                         | 9.1              | 4        | 5,118,048.20   | 2       |
| Energy                         | 5.2              | 2        | 4,937,286.71   | 2       |
| Agri-environmental science     | 3.8              | 2        | 4,094,839.53   | 2       |
| Media                          | 9.1              | 4        | 3,860,665.02   | 1       |
| Ecol, biodivers. & systematics | 3.3              | 2        | 3,793,801.73   | 1       |
| Food science & nutrition       | 5.9              | 3        | 2,455,105.23   | 1       |
| Theology, divinity & religion  | 2.4              | 1        | 2,450,914.54   | 1       |
| Animal Science                 | 4.4              | 2        | 2,419,112.65   | 1       |
| Environmental Engineering      | 1.8              | 1        | 2,390,817.38   | 1       |
| Complexity Science             | 3.8              | 2        | 1,884,220.46   | 1       |
| Pollution, waste & resources   | 2.1              | 1        | 1,630,963.38   | 1       |
| Terrest. & freshwater environ. | 1.6              | 1        | 1,471,464.70   | 1       |
| Philosophy                     | 4.1              | 2        | 1,242,766.84   | 0       |
| Cultural & museum studies      | 5.1              | 2        | 1,165,766.45   | 0       |
| Drama & theatre studies        | 2.5              | 1        | 874,282.45     | 0       |
| Bioengineering                 | 0.7              | 0        | 756,400.51     | 0       |
| Microbial sciences             | 0.5              | 0        | 755,576.74     | 0       |
| Manufacturing                  | 2.7              | 1        | 707,405.79     | 0       |
| Atmospheric phys. & chemistry  | 0.4              | 0        | 577,551.45     | 0       |
| Electrical Engineering         | 2.2              | 1        | 501,733.79     | 0       |
| Systems engineering            | 0.7              | 0        | 443,074.87     | 0       |
| Music                          | 1.8              | 1        | 414,272.52     | 0       |
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
| Economics                                  | 117.7            | 10       | 153,890,034 | 16      |
| Sociology                                  | 160.7            | 14       | 112,617,367 | 12      |
| Social policy                              | 95.6             | 8        | 109,299,745 | 12      |
| Psychology                                 | 166.2            | 14       | 82,113,774  | 9       |
| Human Geography                            | 90.0             | 8        | 78,861,925  | 8       |
| Development studies                        | 64.8             | 5        | 65,592,728  | 7       |
| Education                                  | 73.7             | 6        | 57,988,345  | 6       |
| Management & business studies              | 62.8             | 5        | 53,124,945  | 6       |
| Demography                                 | 17.1             | 1        | 49,879,926  | 5       |
| Political science. & international studies | 97.1             | 8        | 48,290,520  | 5       |
| Tools, technologies & methods              | 25.0             | 2        | 29,752,678  | 3       |
| Law & legal studies                        | 43.5             | 4        | 22,174,153  | 2       |
| Social anthropology                        | 40.0             | 3        | 17,537,490  | 2       |
| Social work                                | 20.3             | 2        | 17,180,172  | 2       |
| Science and Technology Studies             | 24.0             | 2        | 13,085,266  | 1       |
| Environmental planning                     | 16.3             | 1        | 12,565,266  | 1       |
| Linguistics                                | 28.2             | 2        | 11,105,649  | 1       |
| Area Studies                               | 17.8             | 2        | 8,292,006   | 1       |
| History                                    | 18.4             | 2        | 6,370,477   | 1       |

![](ESRC_files/figure-gfm/AwardPiePlot-1.png)<!-- -->

![](ESRC_files/figure-gfm/NumberOfAwardsPiePlot-1.png)<!-- --> \# ToDo
Items

-   [ ] Reconcile DTPs from what was scraped from the [ESRC
    DTP](https://esrc.ukri.org/skills-and-careers/doctoral-training/doctoral-training-partnerships/doctoral-training-partnership-dtp-contacts/)
    web page and what is in the GtR data file (there are more).
-   [ ] Research title looks interesting for further examination but
    will require processing to be comprehensible.
