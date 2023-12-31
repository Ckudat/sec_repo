CREATE TABLE IF NOT EXISTS action (
   id INTEGER PRIMARY KEY,
   command VARCHAR(255) NOT NULL,
   fk_example INT,
   command VARCHAR(255) NOT NULL,
   error JSONB,
   code VARCHAR(255),
   message VARCHAR(255),
   finished VARCHAR(255),
   progress DECIMAL NOT NULL,
   resources JSONB[],
   res_id INTEGER,
   res_type VARCHAR(255),
   started VARCHAR(255) NOT NULL,
   status VARCHAR(255)
   CONSTRAINT uk_action_id UNIQUE (id),
   CONSTRAINT fk_action_id FOREIGN KEY (fk_example) REFERENCES diger_tablo (diger_sutun)
);

CREATE TABLE IF NOT EXISTS certificates (
   id INTEGER PRIMARY KEY,
   certificate VARCHAR[],
   fk_example2 INTEGER,
   created VARCHAR(255) NOT NULL,
   domain_names VARCHAR[],
   fingerprint VARCHAR(255),
   labels JSONB[],
   name VARCHAR(255),
   not_valid_after VARCHAR(255),
   not_valid_before VARCHAR(255),
   status JSONB[],
   type VARCHAR(255),
   used_by VARCHAR[],
   CONSTRAINT uk_certificates_id UNIQUE (id),
   CONSTRAINT fk_certificates_id FOREIGN KEY (fk_example2) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS datacenters (
   id INTEGER PRIMARY KEY,
   description VARCHAR(255) NOT NULL,
   fk_example3 INTEGER,
   location JSONB NOT NULL,
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   location_description VARCHAR(255) NOT NULL,
   location_id INTEGER NOT NULL,
   latitude NUMERIC NOT NULL,
   longitude NUMERIC NOT NULL,
   location_name VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   server_types JSONB,
   available NUMERIC[] NOT NULL,
   available_for_migration NUMERIC[] NOT NULL,
   supported NUMERIC[] NOT NULL,
   recommendation NUMERIC NOT NULL,
   CONSTRAINT uk_datacenters_id UNIQUE (id),
   CONSTRAINT fk_datacenters_id FOREIGN KEY (fk_example3) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS firewalls (
   id INTEGER PRIMARY KEY,
   firewalls JSONB[],
   applied_to JSONB[],
   applied_to_resources JSONB[],
   server JSONB,
   server_id INTEGER NOT NULL,
   res_type VARCHAR(255),
   label_selector VARCHAR(255), 
   fk_example4 INTEGER,
   created VARCHAR(255) NOT NULL,
   name VARCHAR(255) NOT NULL,
   labels JSONB,
   rules JSONB[],
   rule_description VARCHAR(255),
   destination_ips VARCHAR[],
   direction VARCHAR(255) NOT NULL,
   port VARCHAR(255),
   protocol VARCHAR(255) NOT NULL,
   source_ips VARCHAR[],
   CONSTRAINT uk_firewalls_id UNIQUE (id),
   CONSTRAINT fk_firewalls_id FOREIGN KEY (fk_example4) REFERENCES diger_tablo (diger_sutun)
);
);
CREATE TABLE IF NOT EXISTS floating_ips (
   id INTEGER PRIMARY KEY,
   floating_ips JSONB[],
   blocked BOOLEAN,
   description VARCHAR(255),
   dns_ptr JSONB[],
   dns_ptr VARCHAR(255) NOT NULL,
   dns_ptr_ip VARCHAR(255) NOT NULL,
   home_location JSONB, 
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   location_description VARCHAR(255) NOT NULL,
   location_id INTEGER NOT NULL,
   latitude NUMERIC NOT NULL,
   longitude NUMERIC NOT NULL,
   location_name VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   fk_example5 INTEGER,
   ip VARCHAR(255) NOT NULL,
   name VARCHAR(255) NOT NULL,
   labels JSONB,
   protection JSONB,
   delete BOOLEAN,
   server INTEGER,
   type VARCHAR(255) NOT NULL,
   CONSTRAINT uk_floating_ips_id UNIQUE (id),
   CONSTRAINT fk_floating_ips_id FOREIGN KEY (fk_example5) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS certificates (
   id INTEGER PRIMARY KEY,
   images JSONB[],
   fk_example6 INTEGER,
   arcitecture VARCHAR(255) NOT NULL,
   bound_to INTEGER,
   created VARCHAR(255) NOT NULL,
   created_from JSONB,
   created_from_id INTEGER NOT NULL,
   created_from_name VARCHAR(255) NOT NULL,
   deleted VARCHAR(255),
   deprecated VARCHAR(255),
   description VARCHAR(255) NOT NULL,
   disk_size NUMERIC NOT NULL,
   image_size NUMERIC,
   labels JSONB,
   name VARCHAR(255),
   os_flavor VARCHAR(255) NOT NULL,
   protection JSONB,
   delete BOOLEAN, 
   radip_deploy BOOLEAN,
   status VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
   CONSTRAINT uk_images_id UNIQUE (id),
   CONSTRAINT fk_images_id FOREIGN KEY (fk_example6) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS isos (
   id INTEGER PRIMARY KEY,
   archtitecture VARCHAR(255),
   fk_example7 INTEGER,
   deprecated VARCHAR(255),
   description VARCHAR(255) NOT NULL,
   name VARCHAR(255),
   isos JSONB[],
   name VARCHAR(255),
   type VARCHAR(255) NOT NULL,
   CONSTRAINT uk_isos_id UNIQUE (id),
   CONSTRAINT fk_isos_id FOREIGN KEY (fk_example7) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS load_balancers (
   id INTEGER PRIMARY KEY,
   algorithm JSONB,
   type VARCHAR(255) NOT NULL,
   fk_example8 INTEGER,
   created VARCHAR(255) NOT NULL,
   description VARCHAR(255) NOT NULL,
   included_traffic INTEGER NOT NULL,
   ingoing_traffic INTEGER,
   labels JSONB,
   load_balancer_type JSONB,
   deprecated VARCHAR(255),
   description VARCHAR(255) NOT NULL,
   type_id INTEGER NOT NULL,
   max_assigned_certificates NUMERIC NOT NULL,
   max_connections NUMERIC NOT NULL,
   max_targets NUMERIC NOT NULL,
   max_services NUMERIC NOT NULL,
   name VARCHAR(255) NOT NULL,
   prices JSONB[],
   location VARCHAR(255) NOT NULL,
   price_hourly JSONB,
   hourly_gross VARCHAR(255) NOT NULL,
   hourly_net VARCHAR(255) NOT NULL,
   price_monthly JSONB,
   monthly_gross VARCHAR(255) NOT NULL,
   monthly_net VARCHAR(255) NOT NULL,
   location JSONB, 
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   location_description VARCHAR(255) NOT NULL,
   location_id INTEGER NOT NULL,
   latitude NUMERIC NOT NULL,
   longitude NUMERIC NOT NULL,
   location_name VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   resource_name VARCHAR(255) NOT NULL,
   outgoing_traffic INTEGER,
   private_net JSONB[],
   ip_net VARCHAR(255) NOT NULL,
   network INTEGER NOT NULL,
   protection JSONB,
   delete BOOLEAN,
   public_net JSONB,
   enabled BOOLEAN,
   ipv4 JSONB,
   dns_ptr_ipv4 VARCHAR(255),
   ip_ipv4 VARCHAR(255),
   ipv6 JSONB,
   dns_ptr_ipv6 VARCHAR(255),
   ip_ipv6 VARCHAR(255),
   services JSONB[],
   destination_port INTEGER NOT NULL,
   health_check JSON,
   http_conf JSONB,
   domain VARCHAR(255),
   path VARCHAR(255) NOT NULL,
   response VARCHAR(255),
   status_codes VARCHAR[],
   tls BOOLEAN,
   interval INTEGER NOT NULL,
   port INTEGER NOT NULL,
   protocol VARCHAR(255) NOT NULL,	
   retries INTEGER NOT NULL,
   timeout INTEGGER NOT NULL,
   http_options JSONB,
   listen_port INTEGER NOT NULL,
   protocol VARCHAR(255) NOT NULL,
   proxyprotocol BOOLEAN,
   targets JSONB[],
   CONSTRAINT uk_load_balancers_name UNIQUE (resource_name),
   CONSTRAINT uk_load_balancers_id UNIQUE (id),
   CONSTRAINT fk_load_balancers_id FOREIGN KEY (fk_example8) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS locations (
   id INTEGER PRIMARY KEY,
   locations JSONB[],
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   description VARCHAR(255) NOT NULL,
   latitude NUMERIC NOT NULL,
   longitude NUMERIC NOT NULL,
   name VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   fk_example9 INTEGER,
   CONSTRAINT uk_locations_id UNIQUE (id),
   CONSTRAINT fk_locations_id FOREIGN KEY (fk_example9) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS primary_ips (
   id INTEGER PRIMARY KEY,
   primary_ips JSONB[],
   assignee_id INTEGER,
   asignee_type VARCHAR(255) NOT NULL,
   auto_delete BOOLEAN,
   blocked BOOLEAN,
   created VARCHAR(255) NOT NULL,
   datacenter JSONB,
   description VARCHAR(255) NOT NULL,
   location JSONB,
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   location_description VARCHAR(255) NOT NULL,
   location_id INTEGER NOT NULL,
   latitude NUMERIC NOT NULL,
   longitude NUMERIC NOT NULL,
   location_name VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   datacenter_name VARCHAR(255) NOT NULL,
   server_types JSONB,
   available NUMERIC[],
   available_for_migration NUMERIC[],
   supported NUMERIC[],
   dns_ptr JSONB[],
   dns_ptr VARCHAR(255) NOT NULL,
   dns_ptr_ip VARCHAR(255) NOT NULL,
   ip VARCHAR(255) NOT NULL,
   labels JSONB,
   name VARCHAR(255) NOT NULL,
   type VARCHAR(255) NOT NULL,
   protection JSONB,
   fk_example10 INTEGER,
   CONSTRAINT uk_primary_ips_id UNIQUE (id),
   CONSTRAINT uk_primary_ips_name UNIQUE (name),
   CONSTRAINT fk_primary_ips_id FOREIGN KEY (fk_example10) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS networks (
   id INTEGER PRIMARY KEY,
   networks JSONB[],
   created VARCHAR(255) NOT NULL,
   expose_routes_to_vswitch BOOLEAN,
   ip_range_ipv4 VARCHAR(255) NOT NULL,
   labels JSONB,
   load_balancers INTEGER[],
   name VARCHAR(255) NOT NULL,
   protection JSONB,
   delete BOOLEAN,
   routes JSONB[],
   destination VARCHAR(255) NOT NULL,
   route_gateway VARCHAR(255) NOT NULL,
   servers INTEGER[],
   subnets JSONB[],
   server_gateway VARCHAR(255) NOT NULL,
   ip_range_subnet VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   fk_example11 INTEGER,
   CONSTRAINT uk_networks_id UNIQUE (id),
   CONSTRAINT fk_networks_id FOREIGN KEY (fk_example11) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS placement_groups (
   id INTEGER PRIMARY KEY,
   placement_groups JSONB[],
   created VARCHAR(255) NOT NULL,
   labels JSONB,
   name VARCHAR(255) NOT NULL,
   servers INTEGER[],
   type VARCHAR(255) NOT NULL,
   fk_example12 INTEGER,
   CONSTRAINT uk_placement_groups_id UNIQUE (id),
   CONSTRAINT fk_placement_groups_id FOREIGN KEY (fk_example12) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS pricing (
   id INTEGER PRIMARY KEY,
   pricing JSONB[],
   currency VARCHAR(255) NOT NULL,
   floating_ip JSONB,
   price_monthly JSONB,
   gross VARCHAR(255) NOT NULL,
   net VARCHAR(255) NOT NULL,
   floating_ips JSONB[],
   prices_floating_ips JSONB[],
   location VARCHAR(255) NOT NULL,
   price_monthly JSONB,
   gross_floating ip VARCHAR(255) NOT NULL,
   net_floating_ip VARCHAR(255) NOT NULL,
   type_floating_ip VARCHAR(255) NOT NULL,
   image JSONB,
   price_per_gb_month JSONB,
   gross_image VARCHAR(255) NOT NULL,
   net_image VARCHAR(255) NOT NULL,
   load_balancer_types JSONB[],
   id_load_balancer INTEGER NOT NULL,
   name_load_balancer VARCHAR(255) NOT NULL,
   prices_load_balancer JSONB[],
   location_price VARCHAR(255) NOT NULL,
   price_hourly JSONB,
   gross_hourly VARCHAR(255) NOT NULL,
   net_hourly VARCHAR(255) NOT NULL,
   price_monthly JSONB,
   gross_monthly VARCHAR(255) NOT NULL,
   net_monthly VARCHAR(255) NOT NULL,
   primary_ips JSONB[],
   prices_pimary_ips JSONB[],
   location_primary_ips VARCHAR(255) NOT NULL,
   price_hourly_primary_ips JSONB,
   gross_hourly_primary_ips VARCHAR(255) NOT NULL,
   net_hourly_primary_ips VARCHAR(255) NOT NULL,
   price_monthly_primary_ips JSONB,
   gross_monthly_primary_ips VARCHAR(255) NOT NULL,
   net_monthly_primary_ips VARCHAR(255) NOT NULL,
   type_primary_ips VARCHAR(255) NOT NULL,
   server_backup JSONB,
   percentage VARCHAR(255) NOT NULL,
   server_types JSONB[],
   id_server INTEGER,
   name_server VARCHAR(255) NOT NULL,
   prices_server JSONB[],
   location_server VARCHAR(255) NOT NULL,
   price_hourly_server JSONB,
   gross_hourly_server VARCHAR(255) NOT NULL,
   net_hourly_server VARCHAR(255) NOT NULL,
   price_monthly_server JSONB,
   gross_monthly_server VARCHAR(255) NOT NULL,
   net_monthly_server VARCHAR(255) NOT NULL,
   traffic JSONB,
   price_per_tb JSONB,
   gross_traffic VARCHAR(255) NOT NULL,
   net_traffic VARCHAR(255) NOT NULL,
   vat_rate VARCHAR(255) NOT NULL,
   volume JSONB,
   price_per_gb_month JSONB,
   gross_volume VARCHAR(255) NOT NULL,
   net_volume VARCHAR(255) NOT NULL,
   fk_example13 INTEGER,
   CONSTRAINT uk_prices_id UNIQUE (id),
   CONSTRAINT fk_prices_id FOREIGN KEY (fk_example13) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS ssh_keys (
   id INTEGER PRIMARY KEY,
   ssh_keys JSONB[],
   created VARCHAR(255) NOT NULL,
   fingerprint VARCHAR(255) NOT NULL,
   labels JSONB,
   name VARCHAR(255) NOT NULL,
   public_key VARCHAR(255) NOT NULL,
   fk_example14 INTEGER,
   CONSTRAINT uk_ssh_keys_name UNIQUE (name),
   CONSTRAINT uk_ssh_keys_id UNIQUE (id),
   CONSTRAINT fk_ssh_keys_id FOREIGN KEY (fk_example14) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS servers (
   id INTEGER PRIMARY KEY,
   servers JSONB[],
   created VARCHAR(255) NOT NULL,
   datacenter JSONB,
   description_datacenter VARCHAR(255) NOT NULL,
   id_datacenter INTEGER NOT NULL,
   location JSONB,
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   location_description VARCHAR(255) NOT NULL,
   location_id INTEGER NOT NULL,
   latitude NUMERIC NOT NULL,
   longitude NUMERIC NOT NULL,
   location_name VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   name_datacenter VARCHAR(255) NOT NULL,
   server_types_dc VARCHAR(255) NOT NULL,
   available_server_types NUMERIC[],
   available_for_migration_server_types NUMERIC[],
   supported_server_types NUMERIC[],
   image JSONB,
   architecture VARCHAR(255) NOT NULL,
   bound_to INTEGER,
   created_image VARCHAR(255) NOT NULL,
   created_from_image JSONB,
   deelted_image VARCHAR(255) NOT NULL,
   deprecated VARCHAR(255),
   description_image VARCHAR(255) NOT NULL,
   disk_size_image NUMERIC NOT NULL,
   id_image INTEGER NOT NULL,
   image_size NUMERIC,
   labels_image JSONB,
   name_image VARCHAR(255),
   os_flavor VARCHAR(255) NOT NULL,
   os_version VARCHAR(255),
   protection_image JSONB, 
   delete BOOLEAN,
   rapid_deploy BOOLEAN,
   status_image VARCHAR(255) NOT NULL,
   type_image VARCHAR(255) NOT NULL,
   included_traffic NUMERIC,
   ingoing_traffic NUMERIC,
   iso JSONB, 
   architecture_iso VARCHAR(255),
   deprecated_iso VARCHAR(255),
   description_iso VARCHAR(255) NOT NULL,
   id_iso INTEGER NOT NULL,
   name_iso VARCHAR(255),
   type_iso VARCHAR(255) NOT NULL,
   labels JSONB,
   load_balancers INTEGER[],
   name VARCHAR(255) NOT NULL,
   outgoing_traffic NUMERIC,
   placement_group JSONB,
   created_pg VARCHAR(255) NOT NULL,
   id_pg INTEGER,
   labels_pg JSONB,
   name_pg VARCHAR(255) NOT NULL,
   servers_pg INTEGER[],
   type_pg VARCHAR(255) NOT NULL,
   primary_disk_size NUMERIC NOT NULL,
   private_net JSONB[],
   alias_ips VARCHAR[],
   ip_private_net VARCHAR(255) NOT NULL,
   mac_address_private_net VARCHAR(255) NOT NULL,
   network_private_net INTEGER,
   protection_private_net JSONB,
   delete_pn BOOLEAN,
   rebuild BOOLEAN,
   public_net JSONB,
   firewalls JSONB[],
   id_firewalls INTEGER NOT NULL,
   status_firewalls VARCHAR(255) NOT NULL,
   floating_ips INTEGER[],
   ipv4 JSONB,
   blocked_ipv4 BOOLEAN,
   dns_ptr_ipv4 VARCHAR(255) NOT NULL,
   id_ipv4 INTEGER NOT NULL,
   ip_ipv4 VARCHAR(255) NOT NULL,
   ipv6 JSONB,
   blocked_ipv6 BOOLEAN,
   dns_ptr_ipv6 VARCHAR(255) NOT NULL,
   id_ipv6 INTEGER NOT NULL,
   ip_ipv6 VARCHAR(255) NOT NULL,
   rescue_enabled BOOLEAN,
   server_type JSONB,
   cores NUMERIC NOT NULL,
   cpu_type VARCHAR(255) NOT NULL,
   deprecated_server_type BOOLEAN,
   description_server_type VARCHAR(255) NOT NULL,
   disk NUMERIC NOT NULL,
   id_server_type INTEGER NOT NULL,
   memory NUMERIC,
   name_server_type VARCHAR(255) NOT NULL,
   prices JSONB[],
   location_price VARCHAR(255) NOT NULL,
   price_hourly_st JSONB,
   gross_hourly_st VARCHAR(255) NOT NULL,
   net_hourly_st VARCHAR(255) NOT NULL,
   price_monthly_st JSONB,
   gross_monthly_st VARCHAR(255) NOT NULL,
   net_monthly_st VARCHAR(255) NOT NULL,
   storage_type VARCHAR(255) NOT NULL,
   status VARCHAR(255) NOT NULL,
   volumes INTEGER[],
   fk_example15 INTEGER,
   CONSTRAINT uk_servers_name_pg UNIQUE (name_pg),
   CONSTRAINT uk_servers_name UNIQUE (name),
   CONSTRAINT uk_servers_id UNIQUE (id),
   CONSTRAINT fk_servers_id FOREIGN KEY (fk_example15) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS server_types (
   id INTEGER PRIMARY KEY,
   server_types JSONB[],
   architecture VARCHAR(255) NOT NULL,
   cores NUMERIC NOT NULL,
   cpu_type VARCHAR(255) NOT NULL,
   deprecation JSONB,
   announced VARCHAR(255) NOT NULL,
   unavailable_after VARCHAR(255) NOT NULL,
   description VARCHAR(255) NOT NULL,
   disk NUMERIC, 
   included_traffic NUMERIC NOT NULL, 
   memory NUMERİC,
   name VARCHAR(255) NOT NULL,
   prices JSONB[],
   location VARCHAR(255) NOT NULL,
   price_hourly JSONB,
   gross_hourly VARCHAR(255) NOT NULL,
   net_hourly VARCHAR(255) NOT NULL,
   price_monthly JSONB,
   gross_monthly VARCHAR(255) NOT NULL,
   net_monthly VARCHAR(255) NOT NULL,
   storage_type VARCHAR(255) NOT NULL,
   fk_example16 INTEGER,
   CONSTRAINT uk_server_types_id UNIQUE (id),
   CONSTRAINT fk_server_types_id FOREIGN KEY (fk_example16) REFERENCES diger_tablo (diger_sutun)
);
CREATE TABLE IF NOT EXISTS volumes (
   id INTEGER PRIMARY KEY,
   volumes JSONB[],
   created VARCHAR(255) NOT NULL,
   format VARCHAR(255),
   labels JSONB,
   linux_device VARCHAR(255) NOT NULL,
   location JSONB,
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   location_description VARCHAR(255) NOT NULL,
   location_id INTEGER NOT NULL,
   latitude NUMERIC NOT NULL,
   longitude NUMERIC NOT NULL,
   location_name VARCHAR(255) NOT NULL,
   network_zone VARCHAR(255) NOT NULL,
   name VARCHAR(255) NOT NULL,
   protection JSONB, 
   delete BOOLEAN,
   server INTEGER,
   size NUMERIC,
   status VARCHAR(255) NOT NULL,
   fk_example14 INTEGER,
   CONSTRAINT uk_volumes_name UNIQUE (name),
   CONSTRAINT uk_volumes_id UNIQUE (id),
   CONSTRAINT fk_volumes_id FOREIGN KEY (fk_example14) REFERENCES diger_tablo (diger_sutun)
);





















