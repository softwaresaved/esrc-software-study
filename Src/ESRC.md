Economic and Social Research Council (ESRC) Data
================
**Author**: Mario Antonioletti.<br/>
**Last updated**: 14/01/22.

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
corresponded to data last updated by UKRI on the 14th December 2021.

The data set contains 126,198 rows (after some data cleaning), where a
row corresponds to the record of an award. In this data set 11,414
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
| EPSRC       |                     15,109 |
| Innovate UK |                     11,861 |
| MRC         |                      6,216 |
| BBSRC       |                      4,639 |
| ESRC        |                      3,439 |
| NERC        |                      3,118 |
| STFC        |                      2,328 |
| AHRC        |                      1,239 |
| UKRI        |                        366 |
| NC3Rs       |                         73 |

The number of awards given by each council:

<img src="ESRC_files/figure-gfm/NumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils from the available data." alt="Number of awards across each UKRI councils from the available data."  />

The average award given by funding council:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilPlot-1.png" title="Average award size given in pounds per funding council." alt="Average award size given in pounds per funding council."  />

Average award per founding council ordered by the average award in
tabular form:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| UKRI        |              368 |       366,352,804 |           995,524 |
| MRC         |           10,093 |     6,215,862,193 |           615,859 |
| Innovate UK |           24,555 |    11,860,937,643 |           483,036 |
| EPSRC       |           32,658 |    15,109,471,763 |           462,658 |
| STFC        |            6,983 |     2,327,739,924 |           333,344 |
| ESRC        |           11,414 |     3,438,875,323 |           301,286 |
| NERC        |           10,668 |     3,118,230,938 |           292,298 |
| BBSRC       |           15,965 |     4,639,326,710 |           290,594 |
| NC3Rs       |              461 |        73,371,692 |           159,158 |
| AHRC        |            9,391 |     1,238,764,564 |           131,910 |

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
| EPSRC       |                      6,360 |
| Innovate UK |                      5,051 |
| MRC         |                      1,768 |
| ESRC        |                      1,737 |
| BBSRC       |                      1,339 |
| NERC        |                      1,268 |
| STFC        |                        730 |
| AHRC        |                        442 |
| UKRI        |                        361 |
| NC3Rs       |                         22 |

The number of awards given by each council for active projects:

<img src="ESRC_files/figure-gfm/ActiveNumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils for active projects from the available data." alt="Number of awards across each UKRI councils for active projects from the available data."  />

The average award given by funding council for active projects:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilActProjPlot-1.png" title="Average award size given in pounds per funding council for active projects." alt="Average award size given in pounds per funding council for active projects."  />

Average award per founding council for active projects ordered by the
average award:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| Innovate UK |            3,677 |     5,050,863,568 |         1,373,637 |
| UKRI        |              362 |       361,004,056 |           997,249 |
| MRC         |            3,530 |     1,767,892,463 |           500,819 |
| EPSRC       |           15,606 |     6,359,718,301 |           407,518 |
| NERC        |            3,400 |     1,268,159,841 |           372,988 |
| ESRC        |            4,972 |     1,737,215,317 |           349,400 |
| BBSRC       |            4,677 |     1,338,974,106 |           286,289 |
| STFC        |            2,757 |       730,412,706 |           264,930 |
| AHRC        |            3,185 |       441,649,890 |           138,666 |
| NC3Rs       |              177 |        21,684,553 |           122,512 |

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
| Research Grant   |            6,022 |     2,712,378,714 |         450411.61 |
| Training Grant   |              403 |       574,318,459 |        1425107.84 |
| Fellowship       |            1,423 |       152,178,150 |         106941.78 |
| Studentship      |            3,566 |                 0 |              0.00 |

![](ESRC_files/figure-gfm/esrc_categoriesByYear-1.png)<!-- -->

![](ESRC_files/figure-gfm/esrc_categoriesByPercYear-1.png)<!-- -->

### Active projects category awards only

This information corresponds to projects that are classified as
*Active*.

| Project Catgeory | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-----------------|-----------------:|------------------:|------------------:|
| Research Grant   |            1,260 |     1,222,931,142 |         970580.27 |
| Training Grant   |               70 |       480,445,942 |        6863513.46 |
| Fellowship       |              291 |        33,838,233 |         116282.59 |
| Studentship      |            3,351 |                 0 |              0.00 |

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
|                    University of Essex | Research Grant |        21,872,654 |                                             UK Data Service (2017-2022) |
|                University of Sheffield | Training Grant |        21,103,774 |                       White Rose ESRC Doctoral Training Centre DTG 2011 |
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
|           1460 | Studentship      |                739 |
|           1095 | Studentship      |                291 |
|           1277 | Studentship      |                198 |
|           1095 | Research Grant   |                188 |
|            364 | Fellowship       |                168 |
|           1094 | Studentship      |                160 |
|           1460 | Research Grant   |                 98 |
|           1552 | Studentship      |                 81 |
|            364 | Research Grant   |                 77 |
|           1187 | Studentship      |                 73 |
|           1094 | Research Grant   |                 70 |
|           1464 | Studentship      |                 69 |
|           1461 | Studentship      |                 66 |
|            729 | Research Grant   |                 63 |
|           1642 | Studentship      |                 55 |

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
| London                   |            2,216 |       792,051,354 |         357423.90 |
| Unknown                  |            3,109 |       746,109,189 |         239983.66 |
| South East               |            1,701 |       451,043,933 |         265163.98 |
| East of England          |              209 |       336,756,102 |        1611273.22 |
| Scotland                 |            1,164 |       327,651,838 |         281487.83 |
| North West               |              782 |       202,925,558 |         259495.60 |
| South West               |              564 |       144,274,970 |         255806.68 |
| West Midlands            |              410 |       116,874,466 |         285059.67 |
| East Midlands            |              430 |        84,084,819 |         195546.09 |
| Wales                    |              216 |        77,994,514 |         361085.71 |
| Northern Ireland         |              155 |        55,209,650 |         356191.29 |
| Yorkshire and The Humber |              323 |        54,989,802 |         170247.07 |
| Outside UK               |               87 |        42,660,826 |         490354.32 |
| North East               |               46 |         5,720,679 |         124362.59 |
| NA                       |                2 |           527,623 |         263811.50 |

### Regional distributions of awards for active projects only

We can generate the table for projects that are currently active ordered
by the total award given is shown in the table below.

| Region                   | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------|-----------------:|------------------:|------------------:|
| London                   |              971 |       395,908,815 |         407733.07 |
| Unknown                  |            1,488 |       371,493,074 |         249659.32 |
| South East               |              731 |       209,692,939 |         286857.65 |
| East of England          |               75 |       208,221,637 |        2776288.49 |
| Scotland                 |              473 |       168,127,720 |         355449.73 |
| North West               |              319 |        95,637,204 |         299803.15 |
| South West               |              247 |        77,029,153 |         311858.92 |
| West Midlands            |              148 |        67,573,752 |         456579.41 |
| Wales                    |              115 |        43,137,481 |         375108.53 |
| East Midlands            |              179 |        35,498,829 |         198317.48 |
| Northern Ireland         |               61 |        26,161,989 |         428885.07 |
| Yorkshire and The Humber |              124 |        18,846,578 |         151988.53 |
| Outside UK               |               27 |        17,942,249 |         664527.74 |
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
| Manchester Metropolitan University      |               66 |         5,298,546 |          80281.00 |
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
| Cranfield University                |                3 |         2,943,034 |         981011.33 |
| Innovations for Poverty Action      |                1 |            96,968 |          96968.00 |
| Birmingham City University          |                3 |           290,043 |          96681.00 |
| University of Exeter                |              129 |        12,421,069 |          96287.36 |
| Institute for Fiscal Studies        |               17 |        15,942,996 |         937823.29 |
| University of East London           |               10 |            93,668 |           9366.80 |
| University of California, Berkeley  |                1 |            93,460 |          93460.00 |
| University of Surrey                |               25 |        22,997,221 |         919888.84 |
| Office for National Statistics      |                2 |        17,898,948 |        8949474.00 |
| University of Brighton              |               41 |           342,106 |           8344.05 |
| University of Cape Town             |                4 |         3,264,723 |         816180.75 |
| Open University                     |               35 |         2,811,929 |          80340.83 |
| Manchester Metropolitan University  |               37 |         2,904,094 |          78489.03 |
| University of Bradford              |                4 |           313,743 |          78435.75 |
| University of Plymouth              |                8 |           597,548 |          74693.50 |
| Washington University in St Louis   |                1 |           713,698 |         713698.00 |
| Brunel University                   |               13 |           922,455 |          70958.08 |
| University of Michigan              |                1 |           697,241 |         697241.00 |
| Goldsmiths College                  |               23 |         1,587,713 |          69031.00 |
| University of the Free State        |                1 |           670,903 |         670903.00 |
| University of Edinburgh             |              142 |        91,321,545 |         643109.47 |
| Birkbeck College                    |               54 |         3,411,286 |          63171.96 |
| University College London           |              312 |       195,353,888 |         626134.26 |

The same table ordered by the number of awards:

| Org                                  | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------------------|-----------------:|------------------:|------------------:|
| University College London            |              312 |       195,353,888 |         626134.26 |
| University of Oxford                 |              240 |        85,908,831 |         357953.46 |
| Cardiff University                   |              228 |        58,106,817 |         254854.46 |
| London School of Economics & Pol Sci |              220 |        76,376,744 |         347167.02 |
| University of Cambridge              |              209 |        43,867,382 |         209891.78 |
| King’s College London                |              195 |        57,369,034 |         294200.17 |
| University of Manchester             |              166 |        52,974,388 |         319122.82 |
| University of Sheffield              |              163 |        62,834,024 |         385484.81 |
| University of Southampton            |              148 |        50,360,826 |         340275.85 |
| University of Edinburgh              |              142 |        91,321,545 |         643109.47 |
| University of Leeds                  |              138 |        26,869,634 |         194707.49 |
| University of Bristol                |              133 |        63,419,513 |         476838.44 |
| University of Birmingham             |              132 |        18,315,903 |         138756.84 |
| University of Exeter                 |              129 |        12,421,069 |          96287.36 |
| University of Glasgow                |              126 |        39,438,656 |         313005.21 |
| University of Liverpool              |              115 |        55,411,421 |         481838.44 |
| Durham University                    |              114 |        29,801,705 |         261418.46 |
| Newcastle University                 |              112 |        24,627,153 |         219885.29 |
| Lancaster University                 |              108 |        24,809,396 |         229716.63 |
| University of Warwick                |              106 |        40,086,026 |         378170.06 |
| University of Nottingham             |               94 |        17,258,954 |         183605.89 |
| University of York                   |               87 |        16,736,412 |         192372.55 |
| University of Bath                   |               82 |         9,890,194 |         120612.12 |
| Queen Mary, University of London     |               76 |        10,693,466 |         140703.50 |
| University of Sussex                 |               70 |        30,053,644 |         429337.77 |

## Department awards

### Department awards for all projects

There are 1177 unique departments. The table below only shows
departments that have 30 or more occurrences. The Departments below have
been ‘cleaned’ to remove minor differences, e.g. Cardiff Business School
to Business School and so on.

| Department                             | Number | Percent | Total Awarded (£) |
|:---------------------------------------|-------:|--------:|------------------:|
| Psychology                             |    888 |    7.78 |       155,063,135 |
| Social Science                         |    605 |    5.30 |       209,675,591 |
| Geography                              |    453 |    3.97 |       132,818,372 |
| Economics                              |    436 |    3.82 |       103,383,403 |
| Education                              |    354 |    3.10 |        78,046,026 |
| Sociology                              |    302 |    2.65 |        78,748,846 |
| Law                                    |    271 |    2.37 |        49,225,328 |
| Business School                        |    269 |    2.36 |        94,174,908 |
| Politics                               |    216 |    1.89 |        25,490,808 |
| Social and Political Science           |    153 |    1.34 |        63,475,942 |
| Management                             |    150 |    1.31 |        23,519,136 |
| Applied Social Science                 |    141 |    1.24 |        17,401,675 |
| Anthropology                           |    108 |    0.95 |        14,001,257 |
| Experimental Psychology                |     99 |    0.87 |        22,121,224 |
| Sociology & Social Policy              |     97 |    0.85 |        11,305,140 |
| Politics and International Studies     |     91 |    0.80 |        24,031,074 |
| International Development              |     88 |    0.77 |        14,309,564 |
| Geography Politics and Sociology       |     86 |    0.75 |         7,949,894 |
| Environment, Education and Development |     85 |    0.74 |        24,160,525 |
| Social & Political Science             |     83 |    0.73 |        34,955,714 |
| Health Science                         |     79 |    0.69 |        22,638,619 |
| History                                |     79 |    0.69 |         7,457,117 |
| Epidemiology and Public Health         |     77 |    0.67 |        23,441,020 |
| IFS Research Team                      |     73 |    0.64 |        50,550,150 |
| Economic, Social & Political Sci       |     71 |    0.62 |        58,099,344 |
| Research Department                    |     66 |    0.58 |        27,509,469 |
| Psychological Science                  |     64 |    0.56 |         9,177,714 |
| Politics and International Relations   |     61 |    0.53 |         4,890,554 |
| Policy Studies                         |     58 |    0.51 |        12,665,105 |
| Geography and Planning                 |     58 |    0.51 |         2,274,800 |
| Global Studies                         |     56 |    0.49 |        11,758,682 |
| Social and Economic Research           |     54 |    0.47 |       194,928,356 |
| Health and Life Science                |     50 |    0.44 |         5,496,272 |
| Arts, Humanities & Social Sci          |     49 |    0.43 |                 0 |
| Criminology                            |     47 |    0.41 |        22,701,715 |
| Philosophy Psychology & Language       |     46 |    0.40 |         9,255,042 |
| Government                             |     46 |    0.40 |         6,983,337 |
| Unlisted                               |     45 |    0.39 |         4,878,100 |
| Public Health and Policy               |     44 |    0.39 |        15,936,964 |
| Social and Policy Science              |     44 |    0.39 |         3,718,498 |
| Linguistics and English Language       |     39 |    0.34 |        12,826,299 |
| Sociological Studies                   |     36 |    0.32 |         5,576,363 |
| War Studies                            |     36 |    0.32 |        22,295,187 |
| Education and Professional Studies     |     36 |    0.32 |         7,147,045 |
| Arts Languages and Cultures            |     35 |    0.31 |         3,272,010 |
| Planning and Geography                 |     34 |    0.30 |         4,192,112 |
| Social Pol Sociology & Social Res      |     32 |    0.28 |         3,551,396 |
| Politics & International Relation      |     32 |    0.28 |         8,133,864 |
| Finance                                |     32 |    0.28 |        11,313,590 |
| Social Policy                          |     31 |    0.27 |         4,424,327 |
| Epidemiology and Population Health     |     31 |    0.27 |         6,422,547 |
| Geographical Science                   |     31 |    0.27 |         2,822,791 |
| Arts and Social Sci (FASS)             |     30 |    0.26 |         6,559,757 |

### Department awards for active projects only

There are 650 unique departments for active projects (1177 for all
projects). The table below only shows cases that have 30 or more
occurrences in active projects.

| Department                           | Number | Percent | Total Awarded (£) |
|:-------------------------------------|-------:|--------:|------------------:|
| Psychology                           |    373 |    7.50 |        55,302,456 |
| Social Science                       |    259 |    5.21 |       108,066,685 |
| Geography                            |    202 |    4.06 |        84,581,090 |
| Economics                            |    181 |    3.64 |        39,199,352 |
| Education                            |    179 |    3.60 |        44,780,279 |
| Sociology                            |    149 |    3.00 |        39,745,030 |
| Law                                  |    141 |    2.84 |        13,058,074 |
| Business School                      |    118 |    2.37 |        59,532,591 |
| Politics                             |    101 |    2.03 |         8,605,195 |
| Applied Social Science               |     82 |    1.65 |         9,066,090 |
| Sociology & Social Policy            |     65 |    1.31 |         2,651,744 |
| Economic, Social & Political Sci     |     57 |    1.15 |        45,361,685 |
| Management                           |     56 |    1.13 |         9,652,115 |
| Anthropology                         |     55 |    1.11 |         2,759,406 |
| Geography Politics and Sociology     |     50 |    1.01 |         2,566,784 |
| Arts, Humanities & Social Sci        |     49 |    0.99 |                 0 |
| History                              |     46 |    0.93 |         1,442,202 |
| Epidemiology and Public Health       |     45 |    0.91 |         9,720,721 |
| Health Science                       |     43 |    0.86 |         5,382,249 |
| Social & Political Science           |     41 |    0.82 |        21,630,288 |
| Social and Political Science         |     40 |    0.80 |        42,560,041 |
| Geography and Planning               |     39 |    0.78 |           668,248 |
| Experimental Psychology              |     37 |    0.74 |         5,573,677 |
| International Development            |     35 |    0.70 |         4,649,300 |
| Politics and International Relations |     31 |    0.62 |         1,725,275 |
| Politics and International Studies   |     30 |    0.60 |        15,728,924 |

## Doctoral Training Partnerships

### Active Partnerships

Currently active doctoral partnerships ordered by the start date.

| Lead Organisation                    | Department                              | Start    | End      |  Award (£) |
|:-------------------------------------|:----------------------------------------|:---------|:---------|-----------:|
| University College London            | Economics                               | 01/10/11 | 02/10/21 | 14,505,856 |
| University of Nottingham             | Research and Graduate Services          | 01/10/11 | 02/10/22 |  7,964,843 |
| University of Surrey                 | Psychology                              | 01/10/11 | 02/10/22 | 11,094,593 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/11 | 02/10/21 | 15,316,412 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/11 | 02/10/22 |  8,164,941 |
| University of Cambridge              | Board of Graduate Studies               | 01/10/11 | 02/10/22 | 10,015,074 |
| University of Essex                  | Sociology                               | 01/10/11 | 02/10/22 |  7,884,208 |
| University College London            | Doctoral School                         | 01/10/11 | 02/10/22 | 12,927,461 |
| University of Sussex                 | Research and Enterprise Services        | 01/10/11 | 02/10/22 |  4,865,866 |
| University of Oxford                 | Social Sciences Division                | 01/10/11 | 02/10/22 | 19,130,626 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/11 | 01/10/22 | 24,932,784 |
| University of Bristol                | Research and Enterprise Development     | 01/10/11 | 02/10/21 | 17,563,914 |
| King’s College London                | SSPP School Office                      | 01/10/11 | 31/03/22 |  7,150,273 |
| Durham University                    | Archaeology                             | 01/10/11 | 30/09/23 | 11,794,305 |
| University of Edinburgh              | Sch of Social and Political Science     | 01/10/11 | 02/10/21 | 27,538,201 |
| Queen Mary, University of London     | English                                 | 01/10/11 | 02/10/21 |  5,087,223 |
| Cardiff University                   | Registry                                | 01/10/11 | 02/10/22 | 14,946,728 |
| University of Birmingham             | The Registrar                           | 01/10/11 | 02/04/22 |  6,277,485 |
| University of Sheffield              | Geography                               | 01/10/11 | 02/10/22 | 21,103,774 |
| University of Warwick                | Politics and International Studies      | 03/10/11 | 02/04/22 | 12,411,023 |
| London Business School               | Research and Faculty Office             | 01/08/17 | 02/10/21 |    346,071 |
| University of Bristol                | Education                               | 01/10/17 | 30/09/27 | 17,756,940 |
| University of Cambridge              | Criminology                             | 01/10/17 | 30/09/27 | 12,988,673 |
| University of Leeds                  | Sch of Geography                        | 01/10/17 | 30/09/24 |  2,345,247 |
| University College London            | Epidemiology and Public Health          | 01/10/17 | 30/09/24 |  2,154,131 |
| University College London            | Doctoral School                         | 01/10/17 | 30/09/27 | 18,280,789 |
| University of Edinburgh              | Sch of Geosciences                      | 01/10/17 | 30/09/27 | 17,381,266 |
| University of Essex                  | Registry                                | 01/10/17 | 30/09/27 | 11,606,058 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/17 | 30/09/27 | 17,857,544 |
| Durham University                    | Geography                               | 01/10/17 | 30/09/27 | 11,156,304 |
| University of Oxford                 | Social Sciences Division                | 01/10/17 | 30/09/27 | 12,256,023 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/17 | 30/09/27 | 11,976,473 |
| University of Sheffield              | Geography                               | 01/10/17 | 30/09/27 | 15,429,313 |
| Cardiff University                   | Sch of Social Sciences                  | 01/10/17 | 30/09/27 | 13,588,999 |
| University of Warwick                | Sociology                               | 01/10/17 | 30/09/27 | 12,466,669 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/17 | 30/09/27 | 14,988,643 |
| University College London            | Epidemiology and Public Health          | 01/10/20 | 30/09/26 |  1,453,720 |
| University of the West of England    | Faculty of Health and Life Sciences     | 01/10/20 | 01/10/24 |          0 |

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
| Uncategorised                              | 4,221.0          | 37       | 665,357,094 | 19      |
| Other                                      | 589.1            | 5        | 374,090,771 | 11      |
| Economics                                  | 631.0            | 6        | 350,446,800 | 10      |
| Sociology                                  | 891.4            | 8        | 314,115,114 | 9       |
| Psychology                                 | 1,000.3          | 9        | 274,214,005 | 8       |
| Social policy                              | 452.9            | 4        | 211,431,755 | 6       |
| Political science. & international studies | 591.0            | 5        | 149,586,948 | 4       |
| Education                                  | 402.3            | 4        | 147,731,646 | 4       |
| Development studies                        | 352.6            | 3        | 137,453,872 | 4       |
| Tools, technologies & methods              | 248.7            | 2        | 130,892,258 | 4       |
| Management & business studies              | 426.8            | 4        | 127,884,702 | 4       |
| Demography                                 | 310.2            | 3        | 121,923,338 | 4       |
| Human Geography                            | 229.0            | 2        | 118,266,370 | 3       |
| Linguistics                                | 206.7            | 2        | 58,908,374  | 2       |
| Social anthropology                        | 206.1            | 2        | 56,211,001  | 2       |
| Law & legal studies                        | 215.1            | 2        | 55,422,107  | 2       |
| History                                    | 137.4            | 1        | 40,321,048  | 1       |
| Environmental planning                     | 113.8            | 1        | 38,005,706  | 1       |
| Social work                                | 88.0             | 1        | 30,329,434  | 1       |
| Science and Technology Studies             | 58.7             | 1        | 22,544,127  | 1       |
| Area Studies                               | 40.6             | 0        | 13,385,031  | 0       |

The `Other` category dominates by award amount though the
`Uncategorised` dominate by numbers. Looking at the `Other` category in
more detail:

| Subject                        | Number of awards | Number % | Award (£)      | Award % |
|:-------------------------------|:-----------------|:---------|:---------------|:--------|
| RCUK Programmes                | 155.0            | 26       | 123,439,927.26 | 33      |
| Medical & health interface     | 105.5            | 18       | 80,771,464.80  | 22      |
| Info. & commun. Technol.       | 47.8             | 8        | 25,315,323.50  | 7       |
| Genetics & development         | 9.9              | 2        | 20,700,521.88  | 6       |
| Civil eng. & built environment | 25.4             | 4        | 14,348,275.64  | 4       |
| Climate & Climate Change       | 17.5             | 3        | 11,297,757.63  | 3       |
| Mathematical sciences          | 16.1             | 3        | 9,623,869.32   | 3       |
| Design                         | 18.3             | 3        | 8,094,228.89   | 2       |
| Visual arts                    | 15.1             | 3        | 7,053,320.66   | 2       |
| Agri-environmental science     | 12.3             | 2        | 6,737,178.83   | 2       |
| Energy                         | 12.7             | 2        | 6,600,896.93   | 2       |
| Media                          | 26.4             | 4        | 6,578,338.90   | 2       |
| Animal Science                 | 17.5             | 3        | 6,129,281.47   | 2       |
| Complexity Science             | 8.6              | 1        | 5,450,926.71   | 1       |
| Library & information studies  | 2.2              | 0        | 4,979,172.85   | 1       |
| Ecol, biodivers. & systematics | 6.8              | 1        | 4,864,975.33   | 1       |
| Food science & nutrition       | 14.3             | 2        | 4,789,333.81   | 1       |
| Philosophy                     | 14.7             | 2        | 4,239,294.46   | 1       |
| Theology, divinity & religion  | 6.5              | 1        | 3,116,895.69   | 1       |
| Cultural & museum studies      | 13.8             | 2        | 2,752,950.93   | 1       |
| Environmental Engineering      | 2.2              | 0        | 2,403,605.88   | 1       |
| Pollution, waste & resources   | 4.8              | 1        | 2,105,474.31   | 1       |
| Terrest. & freshwater environ. | 2.5              | 0        | 1,546,208.29   | 0       |
| Microbial sciences             | 1.7              | 0        | 1,280,770.64   | 0       |
| Mechanical Engineering         | 1.0              | 0        | 1,258,921.07   | 0       |
| Manufacturing                  | 5.3              | 1        | 1,073,287.01   | 0       |
| Drama & theatre studies        | 3.8              | 1        | 1,021,262.05   | 0       |
| Bioengineering                 | 1.2              | 0        | 795,586.51     | 0       |
| Marine environments            | 1.9              | 0        | 751,153.37     | 0       |
| Omic sciences & technologies   | 1.5              | 0        | 684,902.92     | 0       |
| Music                          | 3.9              | 1        | 632,967.92     | 0       |
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
| Uncategorised                              | 3,499.0          | 70       | 524,231,858 | 30      |
| Other                                      | 225.3            | 5        | 265,753,172 | 15      |
| Economics                                  | 124.3            | 3        | 149,327,425 | 9       |
| Social policy                              | 102.4            | 2        | 116,707,405 | 7       |
| Sociology                                  | 170.7            | 3        | 111,993,415 | 6       |
| Psychology                                 | 178.0            | 4        | 84,534,261  | 5       |
| Human Geography                            | 96.5             | 2        | 77,531,039  | 4       |
| Development studies                        | 69.4             | 1        | 63,823,495  | 4       |
| Education                                  | 81.9             | 2        | 60,149,023  | 3       |
| Political science. & international studies | 100.4            | 2        | 49,913,001  | 3       |
| Management & business studies              | 66.9             | 1        | 49,858,340  | 3       |
| Demography                                 | 17.8             | 0        | 48,343,804  | 3       |
| Tools, technologies & methods              | 26.1             | 1        | 29,496,702  | 2       |
| Law & legal studies                        | 45.2             | 1        | 22,429,396  | 1       |
| Social work                                | 20.0             | 0        | 16,681,853  | 1       |
| Social anthropology                        | 40.0             | 1        | 16,437,605  | 1       |
| Science and Technology Studies             | 25.1             | 1        | 13,142,325  | 1       |
| Environmental planning                     | 16.7             | 0        | 11,459,591  | 1       |
| Linguistics                                | 28.4             | 1        | 10,401,719  | 1       |
| Area Studies                               | 18.7             | 0        | 8,518,577   | 0       |
| History                                    | 18.7             | 0        | 6,384,249   | 0       |

and again looking to see how the `Other` category breakdown for active
projects only:

| Subject                        | Number of awards | Number % | Award (£)      | Award % |
|:-------------------------------|:-----------------|:---------|:---------------|:--------|
| RCUK Programmes                | 44.4             | 20       | 106,081,955.86 | 40      |
| Medical & health interface     | 47.2             | 21       | 55,403,526.69  | 21      |
| Info. & commun. Technol.       | 21.6             | 10       | 14,204,817.64  | 5       |
| Genetics & development         | 1.1              | 0        | 12,334,983.47  | 5       |
| Civil eng. & built environment | 9.9              | 4        | 9,740,177.38   | 4       |
| Climate & Climate Change       | 6.3              | 3        | 7,364,257.44   | 3       |
| Visual arts                    | 8.7              | 4        | 5,879,008.92   | 2       |
| Energy                         | 6.1              | 3        | 5,079,798.13   | 2       |
| Design                         | 8.6              | 4        | 5,073,718.63   | 2       |
| Mathematical sciences          | 4.9              | 2        | 4,836,541.97   | 2       |
| Library & information studies  | 0.2              | 0        | 4,374,530.80   | 2       |
| Agri-environmental science     | 4.2              | 2        | 4,141,181.48   | 2       |
| Media                          | 9.6              | 4        | 3,809,453.08   | 1       |
| Ecol, biodivers. & systematics | 2.6              | 1        | 3,514,057.75   | 1       |
| Animal Science                 | 4.9              | 2        | 2,518,378.15   | 1       |
| Environmental Engineering      | 1.8              | 1        | 2,390,817.38   | 1       |
| Food science & nutrition       | 6.2              | 3        | 2,313,858.48   | 1       |
| Theology, divinity & religion  | 1.9              | 1        | 2,048,856.04   | 1       |
| Complexity Science             | 3.8              | 2        | 1,883,484.66   | 1       |
| Pollution, waste & resources   | 2.6              | 1        | 1,733,429.88   | 1       |
| Philosophy                     | 4.8              | 2        | 1,401,094.35   | 1       |
| Cultural & museum studies      | 5.5              | 2        | 1,246,266.87   | 0       |
| Terrest. & freshwater environ. | 1.2              | 1        | 1,208,434.99   | 0       |
| Drama & theatre studies        | 2.5              | 1        | 874,282.45     | 0       |
| Bioengineering                 | 0.7              | 0        | 756,400.51     | 0       |
| Microbial sciences             | 0.5              | 0        | 755,576.74     | 0       |
| Marine environments            | 1.5              | 1        | 700,391.52     | 0       |
| Manufacturing                  | 2.3              | 1        | 582,225.10     | 0       |
| Atmospheric phys. & chemistry  | 0.4              | 0        | 577,551.45     | 0       |
| Electrical Engineering         | 2.2              | 1        | 501,733.79     | 0       |
| Systems engineering            | 0.7              | 0        | 443,074.87     | 0       |
| Music                          | 1.5              | 1        | 397,558.25     | 0       |
| Geosciences                    | 0.9              | 0        | 359,453.36     | 0       |
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
| Economics                                  | 124.3            | 10       | 149,327,425 | 16      |
| Social policy                              | 102.4            | 8        | 116,707,405 | 12      |
| Sociology                                  | 170.7            | 14       | 111,993,415 | 12      |
| Psychology                                 | 178.0            | 14       | 84,534,261  | 9       |
| Human Geography                            | 96.5             | 8        | 77,531,039  | 8       |
| Development studies                        | 69.4             | 6        | 63,823,495  | 7       |
| Education                                  | 81.9             | 7        | 60,149,023  | 6       |
| Political science. & international studies | 100.4            | 8        | 49,913,001  | 5       |
| Management & business studies              | 66.9             | 5        | 49,858,340  | 5       |
| Demography                                 | 17.8             | 1        | 48,343,804  | 5       |
| Tools, technologies & methods              | 26.1             | 2        | 29,496,702  | 3       |
| Law & legal studies                        | 45.2             | 4        | 22,429,396  | 2       |
| Social work                                | 20.0             | 2        | 16,681,853  | 2       |
| Social anthropology                        | 40.0             | 3        | 16,437,605  | 2       |
| Science and Technology Studies             | 25.1             | 2        | 13,142,325  | 1       |
| Environmental planning                     | 16.7             | 1        | 11,459,591  | 1       |
| Linguistics                                | 28.4             | 2        | 10,401,719  | 1       |
| Area Studies                               | 18.7             | 1        | 8,518,577   | 1       |
| History                                    | 18.7             | 1        | 6,384,249   | 1       |

![](ESRC_files/figure-gfm/AwardPiePlot-1.png)<!-- -->

![](ESRC_files/figure-gfm/NumberOfAwardsPiePlot-1.png)<!-- --> # ToDo
Items

-   [ ] Reconcile DTPs from what was scraped from the [ESRC
    DTP](https://esrc.ukri.org/skills-and-careers/doctoral-training/doctoral-training-partnerships/doctoral-training-partnership-dtp-contacts/)
    web page and what is in the GtR data file (there are more).
-   [ ] Research title looks interesting for further examination but
    will require processing to be comprehensible.
