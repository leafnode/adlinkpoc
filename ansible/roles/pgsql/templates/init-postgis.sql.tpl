-- Enable PostGIS (includes raster)
CREATE EXTENSION postgis;
-- Enable Topology
CREATE EXTENSION postgis_topology;
-- Enable PostGIS Advanced 3D
-- and other geoprocessing algorithms
--     CREATE EXTENSION postgis_sfcgal;
-- fuzzy matching needed for Tiger
CREATE EXTENSION fuzzystrmatch;
-- rule based standardizer
--     CREATE EXTENSION address_standardizer;
-- example rule data set
--     CREATE EXTENSION address_standardizer_data_us;
-- Enable US Tiger Geocoder
CREATE EXTENSION postgis_tiger_geocoder;

-- Grant access to current tables and views
GRANT SELECT ON ALL TABLES IN SCHEMA public TO {{ pgsql.user }};
-- Now make sure that's also available on new tables and views by default
ALTER DEFAULT PRIVILEGES
IN SCHEMA public -- omit this line to make a default across all schemas
GRANT SELECT
ON TABLES
TO {{ pgsql.user }};

-- Now do the same for sequences
GRANT SELECT, USAGE ON ALL SEQUENCES IN SCHEMA public TO {{ pgsql.user }};
ALTER DEFAULT PRIVILEGES
IN SCHEMA public -- omit this line to make a default across all schemas
GRANT SELECT, USAGE
ON SEQUENCES
TO {{ pgsql.user }};

--Allow readonly user to access topology schema
-- Grant access to current tables and views
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO {{ pgsql.user }};
-- Now make sure that's also available on new tables and views by default
ALTER DEFAULT PRIVILEGES
IN SCHEMA topology -- omit this line to make a default across all schemas
GRANT SELECT
ON TABLES
TO {{ pgsql.user }};

--Allow readonly user to access tiger schema
-- Grant access to current tables and views
GRANT SELECT ON ALL TABLES IN SCHEMA tiger TO {{ pgsql.user }};
-- Now make sure that's also available on new tables and views by default
ALTER DEFAULT PRIVILEGES
IN SCHEMA tiger -- omit this line to make a default across all schemas
GRANT SELECT
ON TABLES
TO {{ pgsql.user }};

-- Now do the same for sequences
GRANT SELECT, USAGE ON ALL SEQUENCES IN SCHEMA topology TO {{ pgsql.user }};
ALTER DEFAULT PRIVILEGES
IN SCHEMA topology -- omit this line to make a default across all schemas
GRANT SELECT, USAGE
ON SEQUENCES
TO {{ pgsql.user }};

GRANT SELECT, USAGE ON ALL SEQUENCES IN SCHEMA tiger TO {{ pgsql.user }};
ALTER DEFAULT PRIVILEGES
IN SCHEMA tiger -- omit this line to make a default across all schemas
GRANT SELECT, USAGE
ON SEQUENCES
TO {{ pgsql.user }};

GRANT USAGE ON SCHEMA topology TO PUBLIC;
GRANT USAGE ON SCHEMA tiger TO PUBLIC;
