### README

#### Overview
This project focuses on analyzing and visualizing data related to the Cool It! NYC program, which aims to provide accessible cooling features in high heat risk neighborhoods. The primary datasets used in this analysis are from the year 2020 and include information on cooling sites, drinking fountains, and spray showers. The goal is to draw insights from the 2020 data and compare it with temperature and weather data from 2020 to 2024 to highlight the importance of continuing and improving the program.

#### Datasets
The main datasets used in this analysis are:

1. **Cool It! NYC 2020 - Cooling Sites**
   - (https://data.cityofnewyork.us/resource/h2bn-gu9k.csv)
   - Contains data on various cooling sites including their status, type, and location.

2. **Cool It! NYC 2020 - Drinking Fountains**
   - (https://data.cityofnewyork.us/resource/wxhr-qbhz.csv?$limit=50000)
   - Contains data on drinking fountains, including their activation status, type, and location.

3. **Cool It! NYC 2020 - Spray Showers**
   - (https://data.cityofnewyork.us/resource/tzuk-eq2f.csv)
   - Contains data on spray showers, including their status, type, and location.

Additional datasets to be used for comparison and visualization include(Not included in the current version):
- NYC Heat Vulnerability Index (HVI) data
- Temperature and weather data for NYC from 2020 to 2024
- Health impact data on heat-related illnesses and mortality

#### Analysis and Visualization
The following steps were taken to analyze and visualize the data:

1. **Data Selection and Filtering:**
   - Selected relevant columns from each dataset.
   - Filtered the data to include only activated cooling features.

2. **Data Aggregation:**
   - Aggregated the data by borough and type of cooling feature to get counts of activated features.

3. **Visualization:**
   - Created maps to show the geographical distribution of cooling sites.
   - Generated bar charts to visualize the number of drinking fountains and spray showers by borough.

4. **Exporting Results:**
   - Exported the aggregated data into CSV files.
   - Saved the generated plots as PNG files.

### Findings and Impact
The analysis aims to provide insights into the distribution and functionality of cooling features in NYC during heat emergencies. The findings will highlight areas where the cooling infrastructure has improved and identify neighborhoods that still lack adequate cooling features. This information is crucial for informing future policy adjustments and ensuring equitable distribution of cooling resources, thereby enhancing public health and safety during extreme heat events.

### Challenges
Challenges in this analysis include obtaining accurate and complete data, dealing with missing or inconsistent data entries, and ensuring precise spatial analysis. Communicating the findings effectively to a non-technical audience is also a challenge that needs to be addressed.

### Conclusion
This analysis serves as a preliminary step in understanding the effectiveness of the Cool It! NYC program. By comparing the data from 2020 to subsequent years, we aim to provide actionable insights that can help improve the program and ensure better-prepared cities in the face of increasing heat risks due to climate change.
