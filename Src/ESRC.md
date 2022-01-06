Economic and Social Research Council (ESRC) Data
================
**Author**: Mario Antonioletti.<br/>
**Last updated**: 06/01/22.

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
-   [ToDo Items](#todo-items)

# Introduction

The aim of this document is to provide an overview of expenditure done
of the [United Kingdom Research and Innovation](https://www.ukri.org/)
(UKRI) ESRC as determined from a [Gateway to
Research](https://gtr.ukri.org/) (GtR) data snapshot. The data is made
available under an [Open Government
Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/),
and covers the period 01/01/73 to 01/01/30. The GtR data snapshot was
downloaded from the GtR website on the 11/12/21 and corresponded to data
last updated by UKRI on the 23rd November
2021.<!-- 28th October 2021.--><!-- 11/10/21 and corresponded to data last updated by UKRI on the 30th of September 2021. -->

The data set contains 125,135 rows (after some data cleaning), where a
row corresponds to the record of an award. In this data set 11,352
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
| EPSRC       |                     15,100 |
| Innovate UK |                     11,814 |
| MRC         |                      6,191 |
| BBSRC       |                      4,635 |
| ESRC        |                      3,382 |
| NERC        |                      3,092 |
| STFC        |                      2,299 |
| AHRC        |                      1,235 |
| UKRI        |                        358 |
| NC3Rs       |                         73 |

The number of awards given by each council:

<img src="ESRC_files/figure-gfm/NumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils from the available data." alt="Number of awards across each UKRI councils from the available data."  />

The average award given by funding council:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilPlot-1.png" title="Average award size given in pounds per funding council." alt="Average award size given in pounds per funding council."  />

Average award per founding council ordered by the average award in
tabular form:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| UKRI        |              361 |       358,304,719 |           992,534 |
| MRC         |           10,039 |     6,191,333,838 |           616,728 |
| Innovate UK |           24,332 |    11,813,982,665 |           485,533 |
| EPSRC       |           32,272 |    15,099,820,637 |           467,892 |
| STFC        |            6,909 |     2,298,653,250 |           332,704 |
| ESRC        |           11,352 |     3,382,158,375 |           297,935 |
| NERC        |           10,572 |     3,092,096,204 |           292,480 |
| BBSRC       |           15,871 |     4,635,495,847 |           292,073 |
| NC3Rs       |              454 |        72,549,985 |           159,802 |
| AHRC        |            9,333 |     1,234,986,920 |           132,325 |

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
| EPSRC       |                      6,359 |
| Innovate UK |                      5,105 |
| MRC         |                      1,749 |
| ESRC        |                      1,681 |
| BBSRC       |                      1,346 |
| NERC        |                      1,242 |
| STFC        |                        702 |
| AHRC        |                        443 |
| UKRI        |                        353 |
| NC3Rs       |                         21 |

The number of awards given by each council for active projects:

<img src="ESRC_files/figure-gfm/ActiveNumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils for active projects from the available data." alt="Number of awards across each UKRI councils for active projects from the available data."  />

The average award given by funding council for active projects:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilActProjPlot-1.png" title="Average award size given in pounds per funding council for active projects." alt="Average award size given in pounds per funding council for active projects."  />

Average award per founding council for active projects ordered by the
average award:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| Innovate UK |            3,688 |     5,104,522,025 |         1,384,089 |
| UKRI        |              355 |       352,955,971 |           994,242 |
| MRC         |            3,500 |     1,748,567,830 |           499,591 |
| EPSRC       |           15,290 |     6,358,769,810 |           415,878 |
| NERC        |            3,308 |     1,242,025,107 |           375,461 |
| ESRC        |            4,926 |     1,681,459,651 |           341,344 |
| BBSRC       |            4,621 |     1,346,360,158 |           291,357 |
| STFC        |            2,691 |       701,893,385 |           260,830 |
| AHRC        |            3,146 |       443,421,818 |           140,948 |
| NC3Rs       |              170 |        20,862,846 |           122,723 |

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
| Research Grant   |            6,000 |     2,656,182,360 |         442697.06 |
| Training Grant   |              403 |       574,274,761 |        1424999.41 |
| Fellowship       |            1,418 |       151,701,254 |         106982.55 |
| Studentship      |            3,531 |                 0 |              0.00 |

![](ESRC_files/figure-gfm/esrc_categoriesByYear-1.png)<!-- -->

![](ESRC_files/figure-gfm/esrc_categoriesByPercYear-1.png)<!-- -->

### Active projects category awards only

This information corresponds to projects that are classified as
*Active*.

| Project Catgeory | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-----------------|-----------------:|------------------:|------------------:|
| Research Grant   |            1,241 |     1,167,696,070 |         940931.56 |
| Training Grant   |               70 |       480,402,244 |        6862889.20 |
| Fellowship       |              286 |        33,361,337 |         116648.03 |
| Studentship      |            3,329 |                 0 |              0.00 |

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
|                    University of Essex | Research Grant |        44,619,972 | Understanding Society: The UK Household Longitudinal Survey Waves 13-15 |
|              University College London | Research Grant |        36,267,415 |                Centre for Longitudinal Studies, Resource Centre 2015-20 |
|                    University of Essex | Research Grant |        31,987,749 |                                      Understanding Society Waves 6 to 8 |
|                    University of Essex | Research Grant |        30,212,001 |  Understanding Society: The UK Household Longitudinal Study: Waves 9-11 |
|                University of Edinburgh | Training Grant |        27,538,201 |                       Scottish ESRC Doctoral Training Centre DTC 2011 - |
|               University of Manchester | Research Grant |        26,621,454 |                                              The Productivity Institute |
|                University of Liverpool | Training Grant |        24,932,784 |                       North West ESRC Doctoral Training Centre DTG 2011 |
|                    University of Essex | Research Grant |        21,847,174 |                                             UK Data Service (2017-2022) |
|                University of Sheffield | Training Grant |        21,102,259 |                       White Rose ESRC Doctoral Training Centre DTG 2011 |
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
|           1460 | Studentship      |                757 |
|           1095 | Studentship      |                303 |
|           1095 | Research Grant   |                183 |
|           1277 | Studentship      |                182 |
|            364 | Fellowship       |                168 |
|           1094 | Studentship      |                161 |
|           1460 | Research Grant   |                 97 |
|            364 | Research Grant   |                 84 |
|           1552 | Studentship      |                 81 |
|           1187 | Studentship      |                 75 |
|           1094 | Research Grant   |                 70 |
|           1461 | Studentship      |                 66 |
|            729 | Research Grant   |                 63 |
|           1642 | Studentship      |                 53 |
|           1368 | Studentship      |                 52 |

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
| London                   |            2,229 |       791,372,287 |         355034.67 |
| Unknown                  |            3,049 |       744,182,004 |         244074.12 |
| South East               |            1,691 |       441,504,856 |         261090.99 |
| East of England          |              224 |       338,192,539 |        1509788.12 |
| Scotland                 |            1,155 |       319,011,374 |         276200.32 |
| North West               |              779 |       202,732,798 |         260247.49 |
| South West               |              562 |       136,542,612 |         242958.38 |
| West Midlands            |              409 |       116,732,331 |         285409.12 |
| East Midlands            |              428 |        76,086,870 |         177773.06 |
| Wales                    |              215 |        64,798,196 |         301386.96 |
| Northern Ireland         |              155 |        55,209,650 |         356191.29 |
| Yorkshire and The Humber |              321 |        46,883,730 |         146055.23 |
| Outside UK               |               87 |        42,660,826 |         490354.32 |
| North East               |               46 |         5,720,679 |         124362.59 |
| NA                       |                2 |           527,623 |         263811.50 |

### Regional distributions of awards for active projects only

We can generate the table for projects that are currently active ordered
by the total award given is shown in the table below.

| Region                   | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------|-----------------:|------------------:|------------------:|
| London                   |              985 |       395,229,748 |         401248.48 |
| Unknown                  |            1,444 |       370,901,033 |         256856.67 |
| East of England          |               79 |       208,683,553 |        2641563.96 |
| South East               |              725 |       200,153,862 |         276074.29 |
| Scotland                 |              468 |       159,852,668 |         341565.53 |
| North West               |              318 |        95,444,444 |         300139.76 |
| South West               |              245 |        69,620,808 |         284166.56 |
| West Midlands            |              146 |        67,292,452 |         460907.21 |
| Wales                    |              114 |        29,941,163 |         262641.78 |
| East Midlands            |              178 |        27,551,279 |         154782.47 |
| Northern Ireland         |               61 |        26,161,989 |         428885.07 |
| Outside UK               |               27 |        17,942,249 |         664527.74 |
| Yorkshire and The Humber |              122 |        10,740,506 |          88036.93 |
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
| University of the West of England       |               52 |         4,717,707 |          90725.13 |
| Canterbury Christ Church University     |                2 |           181,236 |          90618.00 |
| Office for National Statistics          |                2 |        17,898,948 |        8949474.00 |
| University of the Highlands and Islands |                3 |           264,465 |          88155.00 |
| University of the Arts London           |                3 |           262,006 |          87335.33 |
| Quadram Institute Bioscience            |                1 |            87,062 |          87062.00 |
| Johns Hopkins University                |                1 |           865,561 |         865561.00 |
| University of Huddersfield              |               11 |           950,591 |          86417.36 |
| Manchester Metropolitan University      |               65 |         5,223,968 |          80368.74 |
| University of Hertfordshire             |               14 |         1,083,610 |          77400.71 |
| Aberystwyth University                  |               37 |         2,830,742 |          76506.54 |
| University of Michigan                  |                3 |         2,240,913 |         746971.00 |
| Institute of Development Studies        |               34 |        25,051,833 |         736818.62 |
| National Institute of Public Health     |                1 |           722,163 |         722163.00 |
| Birmingham City University              |                8 |           577,158 |          72144.75 |
| University of Hull                      |               45 |         3,241,152 |          72025.60 |
| University of East London               |               24 |         1,721,019 |          71709.12 |
| Bournemouth University                  |               12 |           855,831 |          71319.25 |
| University of Bolton                    |                1 |            70,844 |          70844.00 |
| SAHFOS                                  |                1 |               700 |            700.00 |
| Institute for Fiscal Studies            |               74 |        50,576,288 |         683463.35 |

### Funding by lead organisation for active projects only

This only shows the top 25 organisations with active projects by the
average value of the award.

| Org                                 | Number of Awards | Total Awarded (£) | Average Award (£) |
|:------------------------------------|-----------------:|------------------:|------------------:|
| Harvard University                  |                1 |            99,739 |          99739.00 |
| Canterbury Christ Church University |                1 |            99,731 |          99731.00 |
| Imperial College London             |               35 |         3,464,829 |          98995.11 |
| Cranfield University                |                3 |         2,943,034 |         981011.33 |
| Innovations for Poverty Action      |                1 |            96,968 |          96968.00 |
| Birmingham City University          |                3 |           290,043 |          96681.00 |
| University of Exeter                |              129 |        12,421,069 |          96287.36 |
| Institute for Fiscal Studies        |               17 |        15,942,996 |         937823.29 |
| University of East London           |               10 |            93,668 |           9366.80 |
| University of California, Berkeley  |                1 |            93,460 |          93460.00 |
| Office for National Statistics      |                2 |        17,898,948 |        8949474.00 |
| University of Surrey                |               26 |        22,986,832 |         884108.92 |
| Heriot-Watt University              |                5 |            42,495 |           8499.00 |
| University of Brighton              |               41 |           342,106 |           8344.05 |
| University of Cape Town             |                4 |         3,264,723 |         816180.75 |
| Open University                     |               35 |         2,811,929 |          80340.83 |
| Manchester Metropolitan University  |               36 |         2,829,516 |          78597.67 |
| University of Bradford              |                4 |           313,743 |          78435.75 |
| University of Plymouth              |                9 |           684,660 |          76073.33 |
| Washington University in St Louis   |                1 |           713,698 |         713698.00 |
| Loughborough University             |               45 |         3,173,665 |          70525.89 |
| University of Michigan              |                1 |           697,241 |         697241.00 |
| Goldsmiths College                  |               23 |         1,587,713 |          69031.00 |
| University of the Free State        |                1 |           670,903 |         670903.00 |
| Birkbeck College                    |               54 |         3,411,286 |          63171.96 |

The same table ordered by the number of awards:

| Org                                  | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------------------|-----------------:|------------------:|------------------:|
| University College London            |              310 |       195,164,571 |         629563.13 |
| University of Oxford                 |              240 |        85,193,937 |         354974.74 |
| Cardiff University                   |              227 |        58,106,073 |         255973.89 |
| King’s College London                |              221 |        56,444,939 |         255406.96 |
| London School of Economics & Pol Sci |              202 |        77,153,467 |         381947.86 |
| University of Cambridge              |              186 |        43,867,382 |         235846.14 |
| University of Manchester             |              167 |        52,952,146 |         317078.72 |
| University of Sheffield              |              161 |        62,728,049 |         389615.21 |
| University of Southampton            |              144 |        42,064,825 |         292116.84 |
| University of Edinburgh              |              142 |        84,682,000 |         596352.11 |
| University of Leeds                  |              138 |        26,869,634 |         194707.49 |
| University of Birmingham             |              133 |        18,676,526 |         140425.01 |
| University of Bristol                |              130 |        55,924,056 |         430185.05 |
| University of Exeter                 |              129 |        12,421,069 |          96287.36 |
| University of Glasgow                |              125 |        38,709,572 |         309676.58 |
| University of Liverpool              |              116 |        55,411,421 |         477684.66 |
| Newcastle University                 |              113 |        24,627,153 |         217939.41 |
| Lancaster University                 |              107 |        24,713,456 |         230966.88 |
| University of Warwick                |              106 |        39,973,392 |         377107.47 |
| University of Nottingham             |               93 |        17,236,348 |         185337.08 |
| Durham University                    |               92 |        29,800,544 |         323918.96 |
| University of York                   |               85 |         8,630,340 |         101533.41 |
| Queen Mary, University of London     |               84 |        10,693,466 |         127303.17 |
| University of Bath                   |               82 |         9,890,194 |         120612.12 |
| University of Sussex                 |               71 |        29,754,031 |         419070.86 |

## Department awards

### Department awards for all projects

There are 1176 unique departments. The table below only shows
departments that have 30 or more occurrences. The Departments below have
been ‘cleaned’ to remove minor differences, e.g. Cardiff Business School
to Business School and so on.

| Department                             | Number | Percent | Total Awarded (£) |
|:---------------------------------------|-------:|--------:|------------------:|
| Psychology                             |    884 |    7.79 |       155,063,135 |
| Social Science                         |    604 |    5.32 |       209,215,687 |
| Geography                              |    450 |    3.96 |       132,441,080 |
| Economics                              |    430 |    3.79 |       103,383,403 |
| Education                              |    348 |    3.07 |        78,044,505 |
| Sociology                              |    289 |    2.55 |        71,017,605 |
| Business School                        |    269 |    2.37 |        94,062,678 |
| Law                                    |    268 |    2.36 |        48,878,200 |
| Politics                               |    216 |    1.90 |        25,360,845 |
| Social and Political Science           |    152 |    1.34 |        63,120,139 |
| Management                             |    149 |    1.31 |        23,519,136 |
| Applied Social Science                 |    141 |    1.24 |        17,126,417 |
| Anthropology                           |    102 |    0.90 |        14,001,257 |
| Experimental Psychology                |     98 |    0.86 |        21,776,720 |
| Sociology & Social Policy              |     96 |    0.85 |        11,282,534 |
| Politics and International Studies     |     91 |    0.80 |        24,031,074 |
| International Development              |     88 |    0.78 |        14,309,525 |
| Geography Politics and Sociology       |     86 |    0.76 |         7,949,894 |
| Environment, Education and Development |     84 |    0.74 |        24,138,283 |
| Social & Political Science             |     80 |    0.70 |        34,226,630 |
| Health Science                         |     79 |    0.70 |        22,638,619 |
| History                                |     77 |    0.68 |         7,457,117 |
| Epidemiology and Public Health         |     77 |    0.68 |        23,441,020 |
| IFS Research Team                      |     73 |    0.64 |        50,550,150 |
| Economic, Social & Political Sci       |     69 |    0.61 |        49,845,458 |
| Research Department                    |     66 |    0.58 |        27,509,469 |
| Psychological Science                  |     64 |    0.56 |         9,177,714 |
| Politics and International Relations   |     61 |    0.54 |         4,890,554 |
| Policy Studies                         |     58 |    0.51 |        12,665,105 |
| Geography and Planning                 |     58 |    0.51 |         2,274,800 |
| Global Studies                         |     56 |    0.49 |        11,758,682 |
| Social and Economic Research           |     54 |    0.48 |       194,928,356 |
| Health and Life Science                |     50 |    0.44 |         5,496,272 |
| Arts, Humanities & Social Sci          |     49 |    0.43 |                 0 |
| Philosophy Psychology & Language       |     46 |    0.41 |         9,255,042 |
| Government                             |     45 |    0.40 |         6,983,337 |
| Unlisted                               |     45 |    0.40 |         4,878,100 |
| Public Health and Policy               |     44 |    0.39 |        15,936,964 |
| Social and Policy Science              |     44 |    0.39 |         3,718,498 |
| Criminology                            |     41 |    0.36 |        22,701,715 |
| Education and Professional Studies     |     41 |    0.36 |         7,147,045 |
| War Studies                            |     40 |    0.35 |        22,269,956 |
| Linguistics and English Language       |     39 |    0.34 |        12,826,299 |
| Sociological Studies                   |     35 |    0.31 |         5,477,753 |
| Arts Languages and Cultures            |     35 |    0.31 |         3,272,010 |
| Planning and Geography                 |     34 |    0.30 |         4,192,112 |
| Politics & International Relation      |     32 |    0.28 |         8,133,864 |
| Finance                                |     32 |    0.28 |        11,313,590 |
| Social Pol Sociology & Social Res      |     31 |    0.27 |         3,551,396 |
| Social Policy                          |     31 |    0.27 |         4,424,327 |
| Geographical Science                   |     31 |    0.27 |         2,822,791 |
| Epidemiology and Population Health     |     31 |    0.27 |         6,422,547 |
| Arts and Social Sci (FASS)             |     30 |    0.26 |         6,559,757 |

### Department awards for active projects only

There are 648 unique departments for active projects (1176 for all
projects). The table below only shows cases that have 30 or more
occurrences in active projects.

| Department                           | Number | Percent | Total Awarded (£) |
|:-------------------------------------|-------:|--------:|------------------:|
| Psychology                           |    370 |    7.51 |        55,663,079 |
| Social Science                       |    260 |    5.28 |       107,606,781 |
| Geography                            |    198 |    4.02 |        84,203,798 |
| Economics                            |    177 |    3.59 |        39,199,352 |
| Education                            |    172 |    3.49 |        44,617,517 |
| Law                                  |    138 |    2.80 |        12,710,946 |
| Sociology                            |    136 |    2.76 |        32,013,789 |
| Business School                      |    120 |    2.44 |        59,420,361 |
| Politics                             |    101 |    2.05 |         8,475,232 |
| Applied Social Science               |     82 |    1.66 |         8,790,832 |
| Sociology & Social Policy            |     64 |    1.30 |         2,629,138 |
| Management                           |     55 |    1.12 |         9,652,115 |
| Economic, Social & Political Sci     |     55 |    1.12 |        37,107,799 |
| Geography Politics and Sociology     |     50 |    1.02 |         2,566,784 |
| Arts, Humanities & Social Sci        |     49 |    0.99 |                 0 |
| Anthropology                         |     49 |    0.99 |         2,759,406 |
| Epidemiology and Public Health       |     45 |    0.91 |         9,720,721 |
| History                              |     44 |    0.89 |         1,442,202 |
| Health Science                       |     43 |    0.87 |         5,382,249 |
| Social and Political Science         |     39 |    0.79 |        42,204,238 |
| Geography and Planning               |     39 |    0.79 |           668,248 |
| Social & Political Science           |     39 |    0.79 |        20,901,204 |
| Experimental Psychology              |     38 |    0.77 |         5,229,173 |
| International Development            |     35 |    0.71 |         4,649,261 |
| Politics and International Relations |     31 |    0.63 |         1,725,275 |
| Politics and International Studies   |     30 |    0.61 |        15,728,924 |

## Doctoral Training Partnerships

### Active Partnerships

Currently active doctoral partnerships ordered by the start date.

| Lead Organisation                    | Department                              | Start    | End      |  Award (£) |
|:-------------------------------------|:----------------------------------------|:---------|:---------|-----------:|
| University of Surrey                 | Psychology                              | 01/10/11 | 02/10/22 | 11,094,593 |
| University of Nottingham             | Research and Graduate Services          | 01/10/11 | 02/10/22 |  7,964,843 |
| University College London            | Economics                               | 01/10/11 | 02/10/21 | 14,505,856 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/11 | 02/10/21 | 15,316,412 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/11 | 02/10/22 |  8,164,941 |
| University of Essex                  | Sociology                               | 01/10/11 | 02/10/22 |  7,884,208 |
| University of Oxford                 | Social Sciences Division                | 01/10/11 | 02/10/22 | 19,130,626 |
| University of Cambridge              | Board of Graduate Studies               | 01/10/11 | 02/10/22 | 10,015,074 |
| University of Sussex                 | Research and Enterprise Services        | 01/10/11 | 02/10/22 |  4,865,866 |
| University College London            | Doctoral School                         | 01/10/11 | 02/10/22 | 12,927,461 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/11 | 01/10/22 | 24,932,784 |
| University of Bristol                | Research and Enterprise Development     | 01/10/11 | 02/10/21 | 17,563,914 |
| King’s College London                | SSPP School Office                      | 01/10/11 | 31/03/22 |  7,150,273 |
| Durham University                    | Archaeology                             | 01/10/11 | 30/09/23 | 11,794,305 |
| University of Edinburgh              | Sch of Social and Political Science     | 01/10/11 | 02/10/21 | 27,538,201 |
| Cardiff University                   | Registry                                | 01/10/11 | 02/10/22 | 14,946,728 |
| Queen Mary, University of London     | English                                 | 01/10/11 | 02/10/21 |  5,087,223 |
| University of Birmingham             | The Registrar                           | 01/10/11 | 02/04/22 |  6,277,485 |
| University of Sheffield              | Geography                               | 01/10/11 | 02/10/22 | 21,102,259 |
| University of Warwick                | Politics and International Studies      | 03/10/11 | 02/04/22 | 12,411,023 |
| London Business School               | Research and Faculty Office             | 01/08/17 | 02/10/21 |    346,071 |
| University of Bristol                | Education                               | 01/10/17 | 30/09/27 | 17,755,419 |
| University of Leeds                  | Sch of Geography                        | 01/10/17 | 30/09/24 |  2,345,247 |
| University of Cambridge              | Criminology                             | 01/10/17 | 30/09/27 | 12,988,673 |
| University College London            | Epidemiology and Public Health          | 01/10/17 | 30/09/24 |  2,154,131 |
| University College London            | Doctoral School                         | 01/10/17 | 30/09/27 | 18,280,789 |
| University of Edinburgh              | Sch of Geosciences                      | 01/10/17 | 30/09/27 | 17,379,682 |
| University of Essex                  | Registry                                | 01/10/17 | 30/09/27 | 11,604,473 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/17 | 30/09/27 | 17,857,544 |
| University of Oxford                 | Social Sciences Division                | 01/10/17 | 30/09/27 | 12,254,438 |
| Durham University                    | Geography                               | 01/10/17 | 30/09/27 | 11,155,143 |
| Cardiff University                   | Sch of Social Sciences                  | 01/10/17 | 30/09/27 | 13,588,255 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/17 | 30/09/27 | 11,974,889 |
| University of Warwick                | Sociology                               | 01/10/17 | 30/09/27 | 12,466,265 |
| University of Sheffield              | Geography                               | 01/10/17 | 30/09/27 | 15,423,463 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/17 | 30/09/27 | 14,987,709 |
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

For all projects, this gives a breakdown of the number of awards and
amount awarded as:

| Category                                   | Number of awards | Award (£)     |
|:-------------------------------------------|:-----------------|:--------------|
| Other                                      | 1,720            | 1,309,234,143 |
| Economics                                  | 1,205            | 977,428,081   |
| Sociology                                  | 2,120            | 973,573,071   |
| Uncategorised                              | 4,200            | 669,095,758   |
| Psychology                                 | 1,563            | 576,619,954   |
| Social policy                              | 1,144            | 561,063,960   |
| Demography                                 | 736              | 430,479,646   |
| Development studies                        | 900              | 402,851,786   |
| Education                                  | 835              | 402,210,888   |
| Human Geography                            | 593              | 390,230,574   |
| Tools, technologies & methods              | 605              | 386,282,277   |
| Political science. & international studies | 1,164            | 358,095,877   |
| Management & business studies              | 788              | 330,816,871   |
| Social anthropology                        | 494              | 170,802,980   |
| Law & legal studies                        | 474              | 148,830,877   |
| Linguistics                                | 394              | 119,954,626   |
| History                                    | 318              | 114,823,355   |
| Environmental planning                     | 273              | 101,139,857   |
| Social work                                | 212              | 86,945,821    |
| Science and Technology Studies             | 152              | 61,595,683    |
| Area Studies                               | 129              | 48,469,980    |

The `Other` category dominates by award amount though the
`Uncategorised` dominate by numbers. Looking at the `Other` category in
more detail:

| Subject                        | Number of awards | Award (£)   |
|:-------------------------------|:-----------------|:------------|
| RCUK Programmes                | 376              | 327,072,642 |
| Medical & health interface     | 296              | 313,307,633 |
| Genetics & development         | 31               | 95,931,632  |
| Info. & commun. Technol.       | 143              | 89,426,259  |
| Civil eng. & built environment | 80               | 50,878,362  |
| Climate & Climate Change       | 63               | 47,109,029  |
| Visual arts                    | 56               | 35,161,484  |
| Mathematical sciences          | 41               | 33,321,846  |
| Design                         | 59               | 30,522,406  |
| Agri-environmental science     | 45               | 29,990,577  |
| Complexity Science             | 35               | 24,456,399  |
| Library & information studies  | 8                | 24,365,609  |
| Media                          | 82               | 24,324,123  |
| Energy                         | 39               | 22,011,030  |
| Ecol, biodivers. & systematics | 25               | 19,386,080  |
| Animal Science                 | 47               | 17,671,897  |
| Food science & nutrition       | 43               | 16,667,374  |
| Philosophy                     | 46               | 14,391,571  |
| Theology, divinity & religion  | 19               | 12,174,365  |
| Pollution, waste & resources   | 17               | 10,958,985  |
| Cultural & museum studies      | 45               | 9,677,686   |
| Environmental Engineering      | 8                | 9,585,824   |
| Terrest. & freshwater environ. | 11               | 9,306,244   |
| Mechanical Engineering         | 4                | 6,121,077   |
| Microbial sciences             | 7                | 5,341,318   |
| Drama & theatre studies        | 13               | 4,189,840   |
| Omic sciences & technologies   | 5                | 2,984,565   |
| Manufacturing                  | 12               | 2,681,523   |
| Atmospheric phys. & chemistry  | 2                | 2,485,475   |
| Systems engineering            | 4                | 2,447,945   |
| Bioengineering                 | 3                | 2,349,845   |
| Geosciences                    | 10               | 2,303,237   |
| Music                          | 10               | 1,922,717   |
| Electrical Engineering         | 8                | 1,799,765   |
| Marine environments            | 4                | 1,534,490   |
| Cell biology                   | 3                | 1,103,904   |
| Plant & crop science           | 1                | 876,346     |
| Archaeology                    | 5                | 755,745     |
| Materials Processing           | 1                | 614,537     |
| Classics                       | 1                | 604,605     |
| Dance                          | 2                | 304,808     |
| Materials sciences             | 3                | 286,101     |
| Process engineering            | 3                | 244,452     |
| Astronomy - observation        | 1                | 154,236     |
| Astronomy - theory             | 1                | 154,236     |
| Particle Astrophysics          | 1                | 154,236     |
| Catalysis & surfaces           | 1                | 120,083     |

There are some large items near the top. Also, some of the items would
not usually fall under the ESRC area.

If we only focus on currently active projects we get:

| Category                                   | Number of awards | Award (£)   |
|:-------------------------------------------|:-----------------|:------------|
| Other                                      | 693              | 930,538,696 |
| Uncategorised                              | 3,480            | 525,669,962 |
| Economics                                  | 233              | 460,369,620 |
| Sociology                                  | 409              | 388,269,450 |
| Social policy                              | 233              | 280,841,039 |
| Human Geography                            | 246              | 263,433,315 |
| Development studies                        | 193              | 218,904,193 |
| Psychology                                 | 307              | 192,422,408 |
| Demography                                 | 49               | 185,308,260 |
| Education                                  | 163              | 160,058,416 |
| Management & business studies              | 144              | 142,451,796 |
| Political science. & international studies | 193              | 120,737,876 |
| Tools, technologies & methods              | 70               | 105,021,249 |
| Law & legal studies                        | 95               | 66,171,046  |
| Social anthropology                        | 102              | 62,749,981  |
| Social work                                | 47               | 45,960,023  |
| Environmental planning                     | 50               | 43,212,649  |
| Science and Technology Studies             | 66               | 38,907,035  |
| Area Studies                               | 60               | 33,095,666  |
| Linguistics                                | 61               | 26,028,868  |
| History                                    | 47               | 19,738,089  |

and again looking to see how the `Other` category breakdown for active
projects only:

| Subject                        | Number of awards | Award (£)   |
|:-------------------------------|:-----------------|:------------|
| RCUK Programmes                | 139              | 284,394,917 |
| Medical & health interface     | 124              | 212,894,423 |
| Genetics & development         | 4                | 61,270,745  |
| Info. & commun. Technol.       | 65               | 48,791,910  |
| Civil eng. & built environment | 33               | 37,605,408  |
| Climate & Climate Change       | 25               | 33,386,120  |
| Visual arts                    | 32               | 30,473,965  |
| Library & information studies  | 1                | 21,847,174  |
| Agri-environmental science     | 17               | 20,963,719  |
| Design                         | 27               | 20,055,994  |
| Mathematical sciences          | 13               | 19,648,064  |
| Energy                         | 17               | 17,387,671  |
| Media                          | 30               | 14,457,597  |
| Ecol, biodivers. & systematics | 10               | 14,224,739  |
| Pollution, waste & resources   | 9                | 9,540,993   |
| Environmental Engineering      | 6                | 9,534,670   |
| Theology, divinity & religion  | 5                | 8,909,886   |
| Complexity Science             | 16               | 8,768,043   |
| Food science & nutrition       | 19               | 7,990,182   |
| Terrest. & freshwater environ. | 5                | 7,690,792   |
| Animal Science                 | 14               | 7,293,905   |
| Philosophy                     | 14               | 4,598,585   |
| Cultural & museum studies      | 15               | 4,107,551   |
| Drama & theatre studies        | 8                | 3,471,565   |
| Microbial sciences             | 2                | 2,874,555   |
| Atmospheric phys. & chemistry  | 2                | 2,485,475   |
| Bioengineering                 | 2                | 2,271,473   |
| Systems engineering            | 3                | 2,181,855   |
| Electrical Engineering         | 7                | 1,772,626   |
| Geosciences                    | 4                | 1,647,627   |
| Marine environments            | 3                | 1,382,052   |
| Music                          | 4                | 1,255,555   |
| Manufacturing                  | 5                | 1,228,365   |
| Cell biology                   | 3                | 1,103,904   |
| Plant & crop science           | 1                | 876,346     |
| Materials Processing           | 1                | 614,537     |
| Classics                       | 1                | 604,605     |
| Omic sciences & technologies   | 2                | 430,295     |
| Mechanical Engineering         | 3                | 395,522     |
| Process engineering            | 1                | 95,408      |
| Archaeology                    | 1                | 9,878       |

# ToDo Items

-   [ ] Reconcile DTPs from what was scraped from the [ESRC
    DTP](https://esrc.ukri.org/skills-and-careers/doctoral-training/doctoral-training-partnerships/doctoral-training-partnership-dtp-contacts/)
    web page and what is in the GtR data file (there are more).
-   [ ] Research title looks interesting for further examination but
    will require processing to be comprehensible.
