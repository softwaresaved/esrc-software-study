Economic and Social Research Council (ESRC) Data
================
**Author**: Mario Antonioletti.<br/>
**Last updated**: 24/11/21.

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
    -   [Classification of subjects](#classification-of-subjects)
-   [ToDo Items](#todo-items)

# Introduction

The aim of this document is to provide an overview of expenditure done
of the [United Kingdom Research and Innovation](https://www.ukri.org/)
(UKRI) ESRC as determined from a [Gateway to
Research](https://gtr.ukri.org/) (GtR) data snapshot. The data is made
available under an [Open Government
Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/),
and covers the period 01/01/73 to 01/01/30. The GtR data snapshot was
downloaded from the GtR website on the 08/11/21 and corresponded to data
last updated by UKRI on the 28th October
2021.<!-- 11/10/21 and corresponded to data last updated by UKRI on the 30th of September 2021. -->

The data set contains 120,865 rows (after some data cleaning), where a
row corresponds to the record of an award. In this data set 10,834
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
| EPSRC       |                     14,994 |
| Innovate UK |                     11,709 |
| MRC         |                      6,076 |
| BBSRC       |                      4,630 |
| ESRC        |                      3,357 |
| NERC        |                      3,073 |
| STFC        |                      2,275 |
| AHRC        |                      1,223 |
| UKRI        |                        323 |
| NC3Rs       |                         71 |

The number of awards given by each council:

<img src="ESRC_files/figure-gfm/NumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils from the available data." alt="Number of awards across each UKRI councils from the available data."  />

The average award given by funding council:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilPlot-1.png" title="Average award size given in pounds per funding council." alt="Average award size given in pounds per funding council."  />

Average award per founding council ordered by the average award in
tabular form:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| UKRI        |              316 |       322,537,043 |         1,020,687 |
| MRC         |            9,778 |     6,075,879,176 |           621,383 |
| EPSRC       |           30,442 |    14,994,349,564 |           492,555 |
| Innovate UK |           24,111 |    11,708,607,728 |           485,613 |
| STFC        |            6,710 |     2,275,419,041 |           339,109 |
| ESRC        |           10,834 |     3,356,655,640 |           309,826 |
| NERC        |           10,272 |     3,072,845,685 |           299,148 |
| BBSRC       |           15,479 |     4,629,630,223 |           299,091 |
| NC3Rs       |              437 |        71,292,006 |           163,140 |
| AHRC        |            8,851 |     1,223,218,940 |           138,201 |

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
| EPSRC       |                      6,297 |
| Innovate UK |                      5,219 |
| MRC         |                      1,709 |
| ESRC        |                      1,657 |
| BBSRC       |                      1,393 |
| NERC        |                      1,224 |
| STFC        |                        698 |
| AHRC        |                        433 |
| UKRI        |                        320 |
| NC3Rs       |                         19 |

The number of awards given by each council for active projects:

<img src="ESRC_files/figure-gfm/ActiveNumberOfAwards_ByOrg-1.png" title="Number of awards across each UKRI councils for active projects from the available data." alt="Number of awards across each UKRI councils for active projects from the available data."  />

The average award given by funding council for active projects:

<img src="ESRC_files/figure-gfm/AvgAwardPerFundCouncilActProjPlot-1.png" title="Average award size given in pounds per funding council for active projects." alt="Average award size given in pounds per funding council for active projects."  />

Average award per founding council for active projects ordered by the
average award:

| Funding org | Number of awards | Total awarded (£) | Average award (£) |
|:------------|-----------------:|------------------:|------------------:|
| Innovate UK |            4,442 |     5,218,756,309 |         1,174,866 |
| UKRI        |              312 |       319,585,236 |         1,024,312 |
| MRC         |            3,396 |     1,708,965,561 |           503,229 |
| EPSRC       |           13,652 |     6,297,143,923 |           461,262 |
| NERC        |            3,036 |     1,224,397,406 |           403,293 |
| ESRC        |            4,458 |     1,657,106,025 |           371,715 |
| BBSRC       |            4,594 |     1,392,580,774 |           303,130 |
| STFC        |            2,530 |       697,858,187 |           275,833 |
| AHRC        |            2,681 |       432,623,233 |           161,366 |
| NC3Rs       |              154 |        19,441,902 |           126,246 |

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
| Research Grant   |            5,988 |     2,631,071,135 |         439390.64 |
| Training Grant   |              403 |       574,208,131 |        1424834.07 |
| Fellowship       |            1,415 |       151,376,374 |         106979.77 |
| Studentship      |            3,028 |                 0 |              0.00 |

![](ESRC_files/figure-gfm/esrc_categoriesByYear-1.png)<!-- -->

![](ESRC_files/figure-gfm/esrc_categoriesByPercYear-1.png)<!-- -->

### Active projects category awards only

This information corresponds to projects that are classified as
*Active*.

| Project Catgeory | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-----------------|-----------------:|------------------:|------------------:|
| Research Grant   |            1,232 |     1,143,410,400 |         928092.86 |
| Training Grant   |               72 |       480,410,834 |        6672372.69 |
| Fellowship       |              284 |        33,284,791 |         117199.97 |
| Studentship      |            2,870 |                 0 |              0.00 |

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
|              University College London | Research Grant |        35,772,415 |                Centre for Longitudinal Studies, Resource Centre 2015-20 |
|                    University of Essex | Research Grant |        31,987,749 |                                      Understanding Society Waves 6 to 8 |
|                    University of Essex | Research Grant |        30,212,001 |  Understanding Society: The UK Household Longitudinal Study: Waves 9-11 |
|                University of Edinburgh | Training Grant |        27,538,201 |                       Scottish ESRC Doctoral Training Centre DTC 2011 - |
|               University of Manchester | Research Grant |        26,621,454 |                                              The Productivity Institute |
|                University of Liverpool | Training Grant |        24,932,784 |                       North West ESRC Doctoral Training Centre DTG 2011 |
|                    University of Essex | Research Grant |        21,847,174 |                                             UK Data Service (2017-2022) |
|                University of Sheffield | Training Grant |        21,102,259 |                       White Rose ESRC Doctoral Training Centre DTG 2011 |
|                   University of Oxford | Training Grant |        19,130,534 |             University of Oxford ESRC Doctoral Training Centre DTG 2011 |
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
|           1460 | Studentship      |                624 |
|           1095 | Research Grant   |                204 |
|           1095 | Studentship      |                186 |
|            364 | Fellowship       |                178 |
|           1094 | Studentship      |                164 |
|           1277 | Studentship      |                144 |
|            364 | Research Grant   |                 93 |
|           1460 | Research Grant   |                 88 |
|           1552 | Studentship      |                 79 |
|           1461 | Studentship      |                 73 |
|           1187 | Studentship      |                 72 |
|           1094 | Research Grant   |                 70 |
|            729 | Research Grant   |                 57 |
|           1186 | Studentship      |                 53 |
|           1642 | Studentship      |                 52 |

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
| London                   |            2,146 |       787,629,225 |         367022.01 |
| Unknown                  |            2,889 |       732,939,310 |         253700.00 |
| South East               |            1,606 |       440,321,751 |         274172.95 |
| East of England          |              211 |       337,843,043 |        1601151.86 |
| Scotland                 |            1,107 |       318,742,093 |         287933.24 |
| North West               |              761 |       202,140,437 |         265624.75 |
| South West               |              531 |       135,904,528 |         255940.73 |
| West Midlands            |              388 |       116,408,219 |         300021.18 |
| East Midlands            |              401 |        75,599,871 |         188528.36 |
| Wales                    |              199 |        64,699,705 |         325124.15 |
| Northern Ireland         |              154 |        48,860,541 |         317276.24 |
| Yorkshire and The Humber |              308 |        46,657,789 |         151486.33 |
| Outside UK               |               87 |        42,660,826 |         490354.32 |
| North East               |               44 |         5,720,679 |         130015.43 |
| NA                       |                2 |           527,623 |         263811.50 |

### Regional distributions of awards for active projects only

We can generate the table for projects that are currently active ordered
by the total award given is shown in the table below.

| Region                   | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------|-----------------:|------------------:|------------------:|
| London                   |              914 |       391,942,746 |         428821.39 |
| Unknown                  |            1,299 |       359,876,346 |         277041.07 |
| East of England          |               69 |       208,363,309 |        3019758.10 |
| South East               |              648 |       198,970,757 |         307053.64 |
| Scotland                 |              425 |       159,790,596 |         375977.87 |
| North West               |              305 |        95,100,417 |         311804.65 |
| South West               |              215 |        68,982,724 |         320849.88 |
| West Midlands            |              125 |        66,968,340 |         535746.72 |
| Wales                    |               99 |        29,842,672 |         301441.13 |
| East Midlands            |              150 |        27,054,527 |         180363.51 |
| Northern Ireland         |               60 |        19,812,880 |         330214.67 |
| Outside UK               |               27 |        17,942,249 |         664527.74 |
| Yorkshire and The Humber |              110 |        10,514,565 |          95586.95 |
| North East               |               11 |         1,843,525 |         167593.18 |
| NA                       |                1 |           100,372 |         100372.00 |

## Funding by lead organisation

### Funding by lead organisation for all projects

This only shows the top 25 organisations by the average value of the
award.

| Org                                     | Number of Awards | Total Awarded (£) | Average Award (£) |
|:----------------------------------------|-----------------:|------------------:|------------------:|
| University of Copenhagen                |                1 |            97,614 |          97614.00 |
| NERC British Geological Survey          |                1 |             9,753 |           9753.00 |
| University of the West of England       |               49 |         4,708,821 |          96098.39 |
| University of the West of Scotland      |                5 |           473,006 |          94601.20 |
| University of Cape Town                 |                6 |         5,670,678 |         945113.00 |
| Canterbury Christ Church University     |                2 |           181,236 |          90618.00 |
| Office for National Statistics          |                2 |        17,898,948 |        8949474.00 |
| University of the Highlands and Islands |                3 |           264,465 |          88155.00 |
| University of the Arts London           |                3 |           262,006 |          87335.33 |
| Quadram Institute Bioscience            |                1 |            87,062 |          87062.00 |
| Johns Hopkins University                |                1 |           865,561 |         865561.00 |
| University of Huddersfield              |               11 |           950,591 |          86417.36 |
| Manchester Metropolitan University      |               62 |         5,223,968 |          84257.55 |
| University of East London               |               21 |         1,721,019 |          81953.29 |
| University of Hertfordshire             |               14 |         1,083,610 |          77400.71 |
| Aberystwyth University                  |               37 |         2,830,742 |          76506.54 |
| University of Hull                      |               43 |         3,241,152 |          75375.63 |
| University of Michigan                  |                3 |         2,240,913 |         746971.00 |
| Institute of Development Studies        |               34 |        25,051,833 |         736818.62 |
| National Institute of Public Health     |                1 |           722,163 |         722163.00 |
| Birmingham City University              |                8 |           577,158 |          72144.75 |
| Bournemouth University                  |               12 |           855,831 |          71319.25 |
| University of Bolton                    |                1 |            70,844 |          70844.00 |
| SAHFOS                                  |                1 |               700 |            700.00 |
| Institute for Fiscal Studies            |               74 |        50,370,972 |         680688.81 |

### Funding by lead organisation for active projects only

This only shows the top 25 organisations with active projects by the
average value of the award.

| Org                                 | Number of Awards | Total Awarded (£) | Average Award (£) |
|:------------------------------------|-----------------:|------------------:|------------------:|
| Harvard University                  |                1 |            99,739 |          99739.00 |
| Canterbury Christ Church University |                1 |            99,731 |          99731.00 |
| Cranfield University                |                3 |         2,943,034 |         981011.33 |
| University of Reading               |               24 |         2,345,585 |          97732.71 |
| Innovations for Poverty Action      |                1 |            96,968 |          96968.00 |
| Birmingham City University          |                3 |           290,043 |          96681.00 |
| University of Brighton              |               36 |           342,106 |           9502.94 |
| University of California, Berkeley  |                1 |            93,460 |          93460.00 |
| Institute for Fiscal Studies        |               17 |        15,737,680 |         925745.88 |
| University of Surrey                |               25 |        22,761,941 |         910477.64 |
| Office for National Statistics      |                2 |        17,898,948 |        8949474.00 |
| Loughborough University             |               37 |         3,173,665 |          85774.73 |
| Manchester Metropolitan University  |               33 |         2,829,516 |          85742.91 |
| University of Plymouth              |                8 |           684,660 |          85582.50 |
| University of Cape Town             |                4 |         3,264,723 |         816180.75 |
| Birkbeck College                    |               45 |         3,411,286 |          75806.36 |
| Goldsmiths College                  |               21 |         1,587,713 |          75605.38 |
| Washington University in St Louis   |                1 |           713,698 |         713698.00 |
| University of Michigan              |                1 |           697,241 |         697241.00 |
| University of the Free State        |                1 |           670,903 |         670903.00 |
| University College London           |              298 |       192,209,248 |         644997.48 |
| University of Edinburgh             |              134 |        84,313,517 |         629205.35 |
| University of Nairobi               |                1 |           614,772 |         614772.00 |
| University of Lagos                 |                2 |         1,229,275 |         614637.50 |
| University of the Witwatersrand     |                2 |         1,223,884 |         611942.00 |

The same table ordered by the number of awards:

| Org                                  | Number of Awards | Total Awarded (£) | Average Award (£) |
|:-------------------------------------|-----------------:|------------------:|------------------:|
| University College London            |              298 |       192,209,248 |         644997.48 |
| University of Oxford                 |              212 |        85,087,672 |         401356.94 |
| London School of Economics & Pol Sci |              203 |        77,153,467 |         380066.34 |
| Cardiff University                   |              194 |        57,753,590 |         297698.92 |
| King’s College London                |              187 |        55,888,025 |         298866.44 |
| University of Cambridge              |              180 |        43,757,825 |         243099.03 |
| University of Manchester             |              172 |        52,461,785 |         305010.38 |
| University of Sheffield              |              159 |        54,388,829 |         342068.11 |
| University of Edinburgh              |              134 |        84,313,517 |         629205.35 |
| University of Southampton            |              124 |        41,953,513 |         338334.78 |
| University of Leeds                  |              118 |        26,316,633 |         223022.31 |
| University of Bristol                |              116 |        55,911,023 |         481991.58 |
| University of Exeter                 |              111 |        12,119,644 |         109185.98 |
| University of Birmingham             |              109 |        17,784,306 |         163158.77 |
| University of Glasgow                |              109 |        38,637,697 |         354474.28 |
| University of Liverpool              |              107 |        55,411,421 |         517863.75 |
| Newcastle University                 |              101 |        24,657,965 |         244138.27 |
| Durham University                    |               92 |        29,292,951 |         318401.64 |
| Lancaster University                 |               92 |        24,859,790 |         270215.11 |
| University of Warwick                |               86 |        39,649,280 |         461038.14 |
| University of Nottingham             |               77 |        16,777,758 |         217892.96 |
| University of York                   |               77 |         8,404,399 |         109148.04 |
| Queen Mary, University of London     |               73 |        10,693,466 |         146485.84 |
| University of Bath                   |               70 |         9,274,029 |         132486.13 |
| University of Sussex                 |               68 |        29,292,000 |         430764.71 |

## Department awards

### Department awards for all projects

There are 1166 unique departments. The table below only shows
departments that have 30 or more occurrences. The Departments below have
been ‘cleaned’ to remove minor differences, e.g. Cardiff Business School
to Business School and so on.

| Department                             | Number | Percent | Total Awarded (£) |
|:---------------------------------------|-------:|--------:|------------------:|
| Psychology                             |    839 |    7.74 |       154,446,970 |
| Social Science                         |    584 |    5.39 |       208,817,195 |
| Geography                              |    435 |    4.02 |       131,992,135 |
| Economics                              |    421 |    3.89 |       102,887,848 |
| Education                              |    335 |    3.09 |        77,918,564 |
| Sociology                              |    275 |    2.54 |        70,917,605 |
| Business School                        |    254 |    2.34 |        93,862,678 |
| Law                                    |    252 |    2.33 |        48,175,718 |
| Politics                               |    207 |    1.91 |        25,135,954 |
| Social and Political Science           |    150 |    1.38 |        62,954,739 |
| Management                             |    144 |    1.33 |        23,519,136 |
| Applied Social Science                 |    131 |    1.21 |        17,362,110 |
| Anthropology                           |    101 |    0.93 |        14,001,257 |
| Experimental Psychology                |     92 |    0.85 |        21,776,720 |
| Politics and International Studies     |     89 |    0.82 |        24,030,894 |
| Environment, Education and Development |     84 |    0.78 |        24,138,283 |
| International Development              |     84 |    0.78 |        14,309,525 |
| Geography Politics and Sociology       |     80 |    0.74 |         7,949,894 |
| Sociology & Social Policy              |     75 |    0.69 |        11,282,534 |
| Social & Political Science             |     75 |    0.69 |        34,254,755 |
| History                                |     73 |    0.67 |         7,457,117 |
| IFS Research Team                      |     73 |    0.67 |        50,344,834 |
| Health Science                         |     73 |    0.67 |        22,207,732 |
| Epidemiology and Public Health         |     71 |    0.66 |        23,417,504 |
| Research Department                    |     66 |    0.61 |        27,509,469 |
| Economic, Social & Political Sci       |     61 |    0.56 |        49,834,146 |
| Psychological Science                  |     60 |    0.55 |         9,177,714 |
| Politics and International Relations   |     58 |    0.54 |         4,890,554 |
| Global Studies                         |     55 |    0.51 |        11,758,682 |
| Policy Studies                         |     53 |    0.49 |        12,665,105 |
| Geography and Planning                 |     52 |    0.48 |         2,274,800 |
| Social and Economic Research           |     49 |    0.45 |       194,928,356 |
| Philosophy Psychology & Language       |     46 |    0.42 |         9,255,042 |
| Health and Life Science                |     46 |    0.42 |         5,496,272 |
| Unlisted                               |     45 |    0.42 |         4,878,100 |
| Arts, Humanities & Social Sci          |     44 |    0.41 |                 0 |
| Government                             |     43 |    0.40 |         6,983,337 |
| Public Health and Policy               |     42 |    0.39 |        15,936,964 |
| Criminology                            |     41 |    0.38 |        22,692,158 |
| Social and Policy Science              |     39 |    0.36 |         3,718,498 |
| War Studies                            |     36 |    0.33 |        22,269,956 |
| Arts Languages and Cultures            |     35 |    0.32 |         3,272,010 |
| Linguistics and English Language       |     35 |    0.32 |        12,826,299 |
| Education and Professional Studies     |     35 |    0.32 |         7,147,045 |
| Sociological Studies                   |     33 |    0.30 |         5,477,753 |
| Finance                                |     32 |    0.30 |        11,313,590 |
| Social Policy                          |     31 |    0.29 |         4,424,327 |
| Social Pol Sociology & Social Res      |     31 |    0.29 |         3,551,396 |
| Planning and Geography                 |     30 |    0.28 |         4,192,112 |
| Politics & International Relation      |     30 |    0.28 |         8,033,864 |

### Department awards for active projects only

There are 633 unique departments for active projects (1166 for all
projects). The table below only shows cases that have 30 or more
occurrences in active projects.

| Department                         | Number | Percent | Total Awarded (£) |
|:-----------------------------------|-------:|--------:|------------------:|
| Psychology                         |    326 |    7.31 |        55,046,914 |
| Social Science                     |    245 |    5.50 |       107,208,289 |
| Geography                          |    188 |    4.22 |        83,754,853 |
| Economics                          |    170 |    3.81 |        38,703,797 |
| Education                          |    160 |    3.59 |        44,652,817 |
| Sociology                          |    123 |    2.76 |        31,913,789 |
| Law                                |    122 |    2.74 |        12,008,464 |
| Business School                    |    106 |    2.38 |        59,220,361 |
| Politics                           |     93 |    2.09 |         8,250,341 |
| Applied Social Science             |     72 |    1.62 |         9,026,525 |
| Management                         |     53 |    1.19 |         9,652,115 |
| Anthropology                       |     48 |    1.08 |         2,759,406 |
| Economic, Social & Political Sci   |     47 |    1.05 |        37,096,487 |
| Geography Politics and Sociology   |     44 |    0.99 |         2,566,784 |
| Arts, Humanities & Social Sci      |     44 |    0.99 |                 0 |
| Sociology & Social Policy          |     43 |    0.96 |         2,629,138 |
| History                            |     40 |    0.90 |         1,442,202 |
| Epidemiology and Public Health     |     39 |    0.87 |         9,697,205 |
| Social and Political Science       |     38 |    0.85 |        42,038,838 |
| Health Science                     |     37 |    0.83 |         4,951,362 |
| Social & Political Science         |     35 |    0.79 |        20,929,329 |
| Geography and Planning             |     34 |    0.76 |           668,248 |
| Experimental Psychology            |     33 |    0.74 |         5,761,096 |
| International Development          |     31 |    0.70 |         4,649,261 |
| Politics and International Studies |     30 |    0.67 |        15,728,744 |

## Doctoral Training Partnerships

### Active Partnerships

Currently active doctoral partnerships ordered by the start date.

| Lead Organisation                    | Department                              | Start    | End      |  Award (£) |
|:-------------------------------------|:----------------------------------------|:---------|:---------|-----------:|
| University College London            | Economics                               | 01/10/11 | 02/10/21 | 14,505,856 |
| University of Nottingham             | Research and Graduate Services          | 01/10/11 | 02/10/22 |  7,964,843 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/11 | 02/10/21 | 15,316,412 |
| University of Surrey                 | Psychology                              | 01/10/11 | 02/10/22 | 11,094,593 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/11 | 02/10/22 |  8,164,941 |
| University of Cambridge              | Board of Graduate Studies               | 01/10/11 | 02/10/22 | 10,015,074 |
| University of Sussex                 | Research and Enterprise Services        | 01/10/11 | 02/10/22 |  4,864,902 |
| University of Essex                  | Sociology                               | 01/10/11 | 02/10/22 |  7,884,208 |
| University College London            | Doctoral School                         | 01/10/11 | 02/10/22 | 12,927,461 |
| University of Oxford                 | Social Sciences Division                | 01/10/11 | 02/10/22 | 19,130,534 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/11 | 01/10/22 | 24,932,784 |
| University of Bristol                | Research and Enterprise Development     | 01/10/11 | 02/10/21 | 17,563,914 |
| King’s College London                | SSPP School Office                      | 01/10/11 | 31/03/22 |  7,150,273 |
| University of Edinburgh              | Sch of Social and Political Science     | 01/10/11 | 02/10/21 | 27,538,201 |
| Durham University                    | Archaeology                             | 01/10/11 | 30/09/23 | 11,794,305 |
| Cardiff University                   | Registry                                | 01/10/11 | 02/10/22 | 14,946,728 |
| Queen Mary, University of London     | English                                 | 01/10/11 | 02/10/21 |  5,087,223 |
| University of Birmingham             | The Registrar                           | 01/10/11 | 02/04/22 |  6,274,406 |
| University of Sheffield              | Geography                               | 01/10/11 | 02/10/22 | 21,102,259 |
| University of Warwick                | Politics and International Studies      | 03/10/11 | 02/04/22 | 12,410,843 |
| London Business School               | Research and Faculty Office             | 01/08/17 | 02/10/21 |    346,071 |
| University of Cambridge              | Criminology                             | 01/10/17 | 30/09/27 | 12,979,116 |
| University of Leeds                  | Sch of Geography                        | 01/10/17 | 30/09/24 |  2,345,247 |
| University of Bristol                | Education                               | 01/10/17 | 30/09/27 | 17,755,419 |
| University College London            | Epidemiology and Public Health          | 01/10/17 | 30/09/24 |  2,154,131 |
| University of Edinburgh              | Sch of Geosciences                      | 01/10/17 | 30/09/27 | 17,379,682 |
| University College London            | Doctoral School                         | 01/10/17 | 30/09/27 | 18,280,789 |
| University of Essex                  | Registry                                | 01/10/17 | 30/09/27 | 11,598,176 |
| University of Oxford                 | Social Sciences Division                | 01/10/17 | 30/09/27 | 12,248,322 |
| University of Liverpool              | Sch of Law and Social Justice           | 01/10/17 | 30/09/27 | 17,857,544 |
| Durham University                    | Geography                               | 01/10/17 | 30/09/27 | 11,145,710 |
| Cardiff University                   | Sch of Social Sciences                  | 01/10/17 | 30/09/27 | 13,588,255 |
| London School of Economics & Pol Sci | Research & Project Development Division | 01/10/17 | 30/09/27 | 11,974,889 |
| University of Warwick                | Sociology                               | 01/10/17 | 30/09/27 | 12,466,265 |
| University of Sheffield              | Geography                               | 01/10/17 | 30/09/27 | 15,403,920 |
| University of Southampton            | Sch of Economic, Social & Political Sci | 01/10/17 | 30/09/27 | 14,976,397 |
| University of the West of England    | Faculty of Health and Life Sciences     | 01/10/20 | 01/10/24 |          0 |
| University College London            | Epidemiology and Public Health          | 01/10/20 | 30/09/26 |  1,453,720 |

## Award Titles

### Active award titles

A word cloud made from the award titles using the top 250 words thogh
some of the longer words have been excluded.

![](ESRC_files/figure-gfm/ActiveWordCloud-1.png)<!-- -->

## Classification of subjects

Classify the department of the Principal Investigator (assuming that the
department will be linked to the subject of the award).

# ToDo Items

-   [ ] Reconcile DTPs from what was scraped from the [ESRC
    DTP](https://esrc.ukri.org/skills-and-careers/doctoral-training/doctoral-training-partnerships/doctoral-training-partnership-dtp-contacts/)
    web page and what is in the GtR data file (there are more).
-   [ ] Research title looks interesting for further examination but
    will require processing to be comprehensible.
