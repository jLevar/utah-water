-- Use the existing warehouse
USE WAREHOUSE COMPUTE_WH;

-- Database and schema
CREATE DATABASE IF NOT EXISTS UTAH_WATER;
CREATE SCHEMA IF NOT EXISTS UTAH_WATER.RAW;

-- Table
CREATE TABLE IF NOT EXISTS UTAH_WATER.RAW.MONITORING_LOCATIONS (
    -- Identity
    id                                      VARCHAR,
    agency_code                             VARCHAR,
    agency_name                             VARCHAR,
    monitoring_location_number              VARCHAR,
    monitoring_location_name                VARCHAR,

    -- Geography codes
    district_code                           VARCHAR,
    country_code                            VARCHAR,
    country_name                            VARCHAR,
    state_code                              VARCHAR,
    state_name                              VARCHAR,
    county_code                             VARCHAR,
    county_name                             VARCHAR,
    minor_civil_division_code               VARCHAR,

    -- Site classification
    site_type_code                          VARCHAR,
    site_type                               VARCHAR,
    hydrologic_unit_code                    VARCHAR,
    basin_code                              VARCHAR,

    -- Altitude / vertical datum
    altitude                                FLOAT,
    altitude_accuracy                       FLOAT,
    altitude_method_code                    VARCHAR,
    altitude_method_name                    VARCHAR,
    vertical_datum                          VARCHAR,
    vertical_datum_name                     VARCHAR,

    -- Horizontal position
    horizontal_positional_accuracy_code     VARCHAR,
    horizontal_positional_accuracy          VARCHAR,
    horizontal_position_method_code         VARCHAR,
    horizontal_position_method_name         VARCHAR,
    original_horizontal_datum               VARCHAR,
    original_horizontal_datum_name          VARCHAR,

    -- Drainage
    drainage_area                           FLOAT,
    contributing_drainage_area              FLOAT,

    -- Time
    time_zone_abbreviation                  VARCHAR,
    uses_daylight_savings                   VARCHAR,
    construction_date                       DATE,

    -- Aquifer / well
    aquifer_code                            VARCHAR,
    national_aquifer_code                   VARCHAR,
    aquifer_type_code                       VARCHAR,
    well_constructed_depth                  FLOAT,
    hole_constructed_depth                  FLOAT,
    depth_source_code                       VARCHAR,

    -- Revision metadata
    revision_note                           VARCHAR,
    revision_created                        TIMESTAMP_NTZ,
    revision_modified                       TIMESTAMP_NTZ,

    -- Geometry (unpacked from coordinates array)
    longitude                               FLOAT,
    latitude                                FLOAT,

    -- Pipeline metadata (useful later for Airflow)
    _loaded_at                              TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);