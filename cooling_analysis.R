# Install and load required packages
install.packages("tidyverse")
install.packages("sf")
install.packages("ggplot2")

library(tidyverse)
library(sf)
library(ggplot2)

# Load datasets
cooling_sites <- read_csv("https://data.cityofnewyork.us/resource/h2bn-gu9k.csv")
drinking_fountains <- read_csv("https://data.cityofnewyork.us/resource/wxhr-qbhz.csv?$limit=50000")
spray_showers <- read_csv("https://data.cityofnewyork.us/resource/tzuk-eq2f.csv")

# Create a dictionary to map borough abbreviations to full names
borough_names <- c(
  B = "Brooklyn",
  M = "Manhattan",
  Q = "Queens",
  R = "Staten Island",
  X = "Bronx"
)

# Process Cooling Sites dataset
cooling_sites_selected <- cooling_sites %>%
  select(status, featuretype, propertyname, borough, district, x, y) %>%
  mutate(borough = borough_names[borough])

cooling_sites_active <- cooling_sites_selected %>%
  filter(status == "Activated")

cooling_sites_active <- cooling_sites_active %>%
  mutate(type = "Cooling Site")

cooling_sites_summary <- cooling_sites_active %>%
  group_by(borough, type) %>%
  summarize(count = n(), .groups = 'drop')

write_csv(cooling_sites_summary, "cooling_sites_summary.csv")

# Generate Cooling Sites map
cooling_sites_sf <- st_as_sf(cooling_sites_active, coords = c("x", "y"), crs = 4326)

cooling_sites_map <- ggplot() +
  geom_sf(data = cooling_sites_sf, aes(color = featuretype), size = 2) +
  labs(title = "Cooling Sites Locations in NYC", color = "Feature Type") +
  theme_bw() # Set white background
ggsave("cooling_sites_map.png", plot = cooling_sites_map)

# Process Drinking Fountains dataset
drinking_fountains_selected <- drinking_fountains %>%
  select(status = df_activated, featuretype = fountaintype, propertyname, borough, x, y) %>%
  mutate(borough = borough_names[borough])

drinking_fountains_active <- drinking_fountains_selected %>%
  filter(status == "Activated")

drinking_fountains_active <- drinking_fountains_active %>%
  mutate(type = "Drinking Fountain")

drinking_fountains_summary <- drinking_fountains_active %>%
  group_by(borough, type) %>%
  summarize(count = n(), .groups = 'drop')

write_csv(drinking_fountains_summary, "drinking_fountains_summary.csv")

# Generate Drinking Fountains bar chart
drinking_fountains_plot <- ggplot(drinking_fountains_summary, aes(x = borough, y = count, fill = type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Number of Drinking Fountains by Borough", x = "Borough", y = "Count") +
  theme_bw() # Set white background
ggsave("drinking_fountains_summary.png", plot = drinking_fountains_plot)

# Process Spray Showers dataset
spray_showers_selected <- spray_showers %>%
  select(status, featuretype, propertyname, borough, district, x, y) %>%
  mutate(borough = borough_names[borough])

spray_showers_active <- spray_showers_selected %>%
  filter(status == "Activated")

spray_showers_active <- spray_showers_active %>%
  mutate(type = "Spray Shower")

spray_showers_summary <- spray_showers_active %>%
  group_by(borough, type) %>%
  summarize(count = n(), .groups = 'drop')

write_csv(spray_showers_summary, "spray_showers_summary.csv")

# Generate Spray Showers bar chart
spray_showers_plot <- ggplot(spray_showers_summary, aes(x = borough, y = count, fill = type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Number of Spray Showers by Borough", x = "Borough", y = "Count") +
  theme_bw() # Set white background
ggsave("spray_showers_summary.png", plot = spray_showers_plot)
