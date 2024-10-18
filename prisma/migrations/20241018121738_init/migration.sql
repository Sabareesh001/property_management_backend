-- CreateTable
CREATE TABLE "admins" (
    "id" SERIAL NOT NULL,
    "user_id" UUID NOT NULL,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "is_customer" BOOLEAN,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "admins_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "amenities" (
    "id" UUID NOT NULL,
    "name" VARCHAR,
    "price" DECIMAL(10,2),
    "image" VARCHAR,
    "is_free" BOOLEAN,
    "start_date" TIMESTAMP(6),
    "end_date" TIMESTAMP(6),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "amenities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "companies" (
    "id" UUID NOT NULL,
    "name" VARCHAR,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "companies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inventory_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "pricing_based_on" INTEGER NOT NULL,
    "item_unit_price" DECIMAL(10,2),
    "quantity" INTEGER,
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "inventory_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_components_based_ons" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "master_components_based_ons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_pricing_based_on" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "master_pricing_based_on_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_pricing_component_types" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "master_pricing_component_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_revenue_types" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "master_revenue_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "master_tax_groups" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "master_tax_groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "one_time_cost_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "one_time_cost_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parking_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "is_changable" BOOLEAN,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "parking_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "primary_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "maximum" DECIMAL(10,2),
    "minimum" DECIMAL(10,2),
    "recommended" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "primary_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "property_unit_amenities" (
    "id" UUID NOT NULL,
    "property_unit_id" UUID NOT NULL,
    "amenity_id" UUID NOT NULL,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "property_unit_amenities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "property_unit_utilities" (
    "id" UUID NOT NULL,
    "property_unit_id" UUID NOT NULL,
    "utility_id" UUID NOT NULL,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true
);

-- CreateTable
CREATE TABLE "property_units" (
    "id" UUID NOT NULL,
    "name" VARCHAR,
    "unit_id" VARCHAR,
    "address" VARCHAR,
    "company" UUID NOT NULL,
    "beds" INTEGER,
    "baths" INTEGER,
    "bhk" INTEGER,
    "area_in_sqft" DECIMAL(10,2),
    "price_in_aed" DECIMAL(10,2),
    "main_image" VARCHAR,
    "image_list" VARCHAR,
    "primary_pricing_id" UUID NOT NULL,
    "secondary_pricing_id" UUID,
    "one_time_cost_pricing_id" UUID,
    "refundables_pricing_id" UUID,
    "inventory_pricing_id" UUID,
    "parking_pricing_id" UUID,
    "is_deleted" BOOLEAN,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "property_units_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quotation_quoted_properties" (
    "id" UUID NOT NULL,
    "quoted_property_id" UUID NOT NULL,
    "original_property_id" UUID NOT NULL,
    "quotation_id" UUID NOT NULL,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quotation_quoted_properties_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quotations" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "grace_period" INTEGER,
    "lease_start_date" TIMESTAMP(6),
    "lease_end_date" TIMESTAMP(6),
    "rent_start_date" TIMESTAMP(6),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quotations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_inventory_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "pricing_based_on" INTEGER NOT NULL,
    "item_unit_price" DECIMAL(10,2),
    "quantity" INTEGER,
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_inventory_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_one_time_cost_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_one_time_cost_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_parking_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "is_changable" BOOLEAN,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_parking_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_primary_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "maximum" DECIMAL(10,2),
    "minimum" DECIMAL(10,2),
    "recommended" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_primary_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_property_unit_amenities" (
    "id" UUID NOT NULL,
    "quoted_property_unit_id" UUID NOT NULL,
    "amenity_id" UUID NOT NULL,
    "is_free" BOOLEAN,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_property_unit_amenities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_property_unit_utilities" (
    "id" UUID NOT NULL,
    "quoted_property_unit_id" UUID NOT NULL,
    "utility_id" UUID NOT NULL,
    "is_free" BOOLEAN,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_property_unit_utilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_property_units" (
    "id" UUID NOT NULL,
    "property_id" UUID NOT NULL,
    "primary_pricing_id" UUID,
    "secondary_pricing_id" UUID,
    "one_time_cost_pricing_id" UUID,
    "refundables_pricing_id" UUID,
    "inventory_pricing_id" UUID,
    "parking_pricing_id" UUID,
    "is_deleted" BOOLEAN,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_property_units_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_refundables_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_refundables_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quoted_secondary_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "quoted_secondary_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "refundables_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "refundables_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secondary_pricing" (
    "id" UUID NOT NULL,
    "revenue_type" INTEGER NOT NULL,
    "pricing_component" INTEGER NOT NULL,
    "tax_group" INTEGER NOT NULL,
    "component_based_on" INTEGER NOT NULL,
    "uom_value" DECIMAL(10,2),
    "discount" DECIMAL(10,2),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "secondary_pricing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL,
    "name" VARCHAR,
    "mobile_no" VARCHAR,
    "email" VARCHAR,
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "is_customer" BOOLEAN,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "utilities" (
    "id" UUID NOT NULL,
    "name" VARCHAR,
    "image" VARCHAR,
    "price" DECIMAL(10,2),
    "is_free" BOOLEAN,
    "start_date" TIMESTAMP(6),
    "end_date" TIMESTAMP(6),
    "deleted_at" TIMESTAMP(6),
    "deleted_by" UUID,
    "created_by" UUID,
    "created_at" TIMESTAMP(6),
    "is_active" BOOLEAN DEFAULT true,

    CONSTRAINT "utilities_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "admins_user_id_key" ON "admins"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "property_unit_utilities_id_key" ON "property_unit_utilities"("id");

-- CreateIndex
CREATE UNIQUE INDEX "property_units_primary_pricing_id_key" ON "property_units"("primary_pricing_id");

-- CreateIndex
CREATE UNIQUE INDEX "quotations_user_id_key" ON "quotations"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "quoted_property_units_property_id_key" ON "quoted_property_units"("property_id");

-- AddForeignKey
ALTER TABLE "admins" ADD CONSTRAINT "admins_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory_pricing" ADD CONSTRAINT "inventory_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory_pricing" ADD CONSTRAINT "inventory_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory_pricing" ADD CONSTRAINT "inventory_pricing_pricing_based_on_fkey" FOREIGN KEY ("pricing_based_on") REFERENCES "master_pricing_based_on"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory_pricing" ADD CONSTRAINT "inventory_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory_pricing" ADD CONSTRAINT "inventory_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inventory_pricing" ADD CONSTRAINT "inventory_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "one_time_cost_pricing" ADD CONSTRAINT "one_time_cost_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "one_time_cost_pricing" ADD CONSTRAINT "one_time_cost_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "one_time_cost_pricing" ADD CONSTRAINT "one_time_cost_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "one_time_cost_pricing" ADD CONSTRAINT "one_time_cost_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "one_time_cost_pricing" ADD CONSTRAINT "one_time_cost_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "one_time_cost_pricing" ADD CONSTRAINT "one_time_cost_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parking_pricing" ADD CONSTRAINT "parking_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parking_pricing" ADD CONSTRAINT "parking_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parking_pricing" ADD CONSTRAINT "parking_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parking_pricing" ADD CONSTRAINT "parking_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parking_pricing" ADD CONSTRAINT "parking_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parking_pricing" ADD CONSTRAINT "parking_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "primary_pricing" ADD CONSTRAINT "primary_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "primary_pricing" ADD CONSTRAINT "primary_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "primary_pricing" ADD CONSTRAINT "primary_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "primary_pricing" ADD CONSTRAINT "primary_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "primary_pricing" ADD CONSTRAINT "primary_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "primary_pricing" ADD CONSTRAINT "primary_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_unit_amenities" ADD CONSTRAINT "property_unit_amenities_amenity_id_fkey" FOREIGN KEY ("amenity_id") REFERENCES "amenities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_unit_amenities" ADD CONSTRAINT "property_unit_amenities_property_unit_id_fkey" FOREIGN KEY ("property_unit_id") REFERENCES "property_units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_unit_utilities" ADD CONSTRAINT "property_unit_utilities_property_unit_id_fkey" FOREIGN KEY ("property_unit_id") REFERENCES "property_units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_unit_utilities" ADD CONSTRAINT "property_unit_utilities_utility_id_fkey" FOREIGN KEY ("utility_id") REFERENCES "utilities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_company_fkey" FOREIGN KEY ("company") REFERENCES "companies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_inventory_pricing_id_fkey" FOREIGN KEY ("inventory_pricing_id") REFERENCES "inventory_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_one_time_cost_pricing_id_fkey" FOREIGN KEY ("one_time_cost_pricing_id") REFERENCES "one_time_cost_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_parking_pricing_id_fkey" FOREIGN KEY ("parking_pricing_id") REFERENCES "parking_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_primary_pricing_id_fkey" FOREIGN KEY ("primary_pricing_id") REFERENCES "primary_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_refundables_pricing_id_fkey" FOREIGN KEY ("refundables_pricing_id") REFERENCES "refundables_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "property_units" ADD CONSTRAINT "property_units_secondary_pricing_id_fkey" FOREIGN KEY ("secondary_pricing_id") REFERENCES "secondary_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quotation_quoted_properties" ADD CONSTRAINT "quotation_quoted_properties_original_property_id_fkey" FOREIGN KEY ("original_property_id") REFERENCES "property_units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quotation_quoted_properties" ADD CONSTRAINT "quotation_quoted_properties_quotation_id_fkey" FOREIGN KEY ("quotation_id") REFERENCES "quotations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quotation_quoted_properties" ADD CONSTRAINT "quotation_quoted_properties_quoted_property_id_fkey" FOREIGN KEY ("quoted_property_id") REFERENCES "quoted_property_units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quotations" ADD CONSTRAINT "quotations_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_inventory_pricing" ADD CONSTRAINT "quoted_inventory_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_inventory_pricing" ADD CONSTRAINT "quoted_inventory_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_inventory_pricing" ADD CONSTRAINT "quoted_inventory_pricing_pricing_based_on_fkey" FOREIGN KEY ("pricing_based_on") REFERENCES "master_pricing_based_on"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_inventory_pricing" ADD CONSTRAINT "quoted_inventory_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_inventory_pricing" ADD CONSTRAINT "quoted_inventory_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_inventory_pricing" ADD CONSTRAINT "quoted_inventory_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_one_time_cost_pricing" ADD CONSTRAINT "quoted_one_time_cost_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_one_time_cost_pricing" ADD CONSTRAINT "quoted_one_time_cost_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_one_time_cost_pricing" ADD CONSTRAINT "quoted_one_time_cost_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_one_time_cost_pricing" ADD CONSTRAINT "quoted_one_time_cost_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_one_time_cost_pricing" ADD CONSTRAINT "quoted_one_time_cost_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_one_time_cost_pricing" ADD CONSTRAINT "quoted_one_time_cost_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_parking_pricing" ADD CONSTRAINT "quoted_parking_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_parking_pricing" ADD CONSTRAINT "quoted_parking_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_parking_pricing" ADD CONSTRAINT "quoted_parking_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_parking_pricing" ADD CONSTRAINT "quoted_parking_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_parking_pricing" ADD CONSTRAINT "quoted_parking_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_parking_pricing" ADD CONSTRAINT "quoted_parking_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_primary_pricing" ADD CONSTRAINT "quoted_primary_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_primary_pricing" ADD CONSTRAINT "quoted_primary_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_primary_pricing" ADD CONSTRAINT "quoted_primary_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_primary_pricing" ADD CONSTRAINT "quoted_primary_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_primary_pricing" ADD CONSTRAINT "quoted_primary_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_primary_pricing" ADD CONSTRAINT "quoted_primary_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_unit_amenities" ADD CONSTRAINT "quoted_property_unit_amenities_amenity_id_fkey" FOREIGN KEY ("amenity_id") REFERENCES "amenities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_unit_amenities" ADD CONSTRAINT "quoted_property_unit_amenities_quoted_property_unit_id_fkey" FOREIGN KEY ("quoted_property_unit_id") REFERENCES "quoted_property_units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_unit_utilities" ADD CONSTRAINT "quoted_property_unit_utilities_quoted_property_unit_id_fkey" FOREIGN KEY ("quoted_property_unit_id") REFERENCES "quoted_property_units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_unit_utilities" ADD CONSTRAINT "quoted_property_unit_utilities_utility_id_fkey" FOREIGN KEY ("utility_id") REFERENCES "utilities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_units" ADD CONSTRAINT "quoted_property_units_one_time_cost_pricing_id_fkey" FOREIGN KEY ("one_time_cost_pricing_id") REFERENCES "quoted_one_time_cost_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_units" ADD CONSTRAINT "quoted_property_units_parking_pricing_id_fkey" FOREIGN KEY ("parking_pricing_id") REFERENCES "quoted_parking_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_units" ADD CONSTRAINT "quoted_property_units_primary_pricing_id_fkey" FOREIGN KEY ("primary_pricing_id") REFERENCES "quoted_primary_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_units" ADD CONSTRAINT "quoted_property_units_property_id_fkey" FOREIGN KEY ("property_id") REFERENCES "property_units"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_units" ADD CONSTRAINT "quoted_property_units_refundables_pricing_id_fkey" FOREIGN KEY ("refundables_pricing_id") REFERENCES "quoted_refundables_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_property_units" ADD CONSTRAINT "quoted_property_units_secondary_pricing_id_fkey" FOREIGN KEY ("secondary_pricing_id") REFERENCES "quoted_secondary_pricing"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_refundables_pricing" ADD CONSTRAINT "quoted_refundables_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_refundables_pricing" ADD CONSTRAINT "quoted_refundables_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_refundables_pricing" ADD CONSTRAINT "quoted_refundables_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_refundables_pricing" ADD CONSTRAINT "quoted_refundables_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_refundables_pricing" ADD CONSTRAINT "quoted_refundables_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_refundables_pricing" ADD CONSTRAINT "quoted_refundables_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_secondary_pricing" ADD CONSTRAINT "quoted_secondary_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_secondary_pricing" ADD CONSTRAINT "quoted_secondary_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_secondary_pricing" ADD CONSTRAINT "quoted_secondary_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_secondary_pricing" ADD CONSTRAINT "quoted_secondary_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_secondary_pricing" ADD CONSTRAINT "quoted_secondary_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "quoted_secondary_pricing" ADD CONSTRAINT "quoted_secondary_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "refundables_pricing" ADD CONSTRAINT "refundables_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "refundables_pricing" ADD CONSTRAINT "refundables_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "refundables_pricing" ADD CONSTRAINT "refundables_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "refundables_pricing" ADD CONSTRAINT "refundables_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "refundables_pricing" ADD CONSTRAINT "refundables_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "refundables_pricing" ADD CONSTRAINT "refundables_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "secondary_pricing" ADD CONSTRAINT "secondary_pricing_component_based_on_fkey" FOREIGN KEY ("component_based_on") REFERENCES "master_components_based_ons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "secondary_pricing" ADD CONSTRAINT "secondary_pricing_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "secondary_pricing" ADD CONSTRAINT "secondary_pricing_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "secondary_pricing" ADD CONSTRAINT "secondary_pricing_pricing_component_fkey" FOREIGN KEY ("pricing_component") REFERENCES "master_pricing_component_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "secondary_pricing" ADD CONSTRAINT "secondary_pricing_revenue_type_fkey" FOREIGN KEY ("revenue_type") REFERENCES "master_revenue_types"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "secondary_pricing" ADD CONSTRAINT "secondary_pricing_tax_group_fkey" FOREIGN KEY ("tax_group") REFERENCES "master_tax_groups"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
