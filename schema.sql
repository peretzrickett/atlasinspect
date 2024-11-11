-- Add new schema named "company"
CREATE SCHEMA "company";
-- Add new schema named "public"
CREATE SCHEMA IF NOT EXISTS "public";
-- Set comment to schema: "public"
COMMENT ON SCHEMA "public" IS 'standard public schema';
-- Create "departments" table
CREATE TABLE "company"."departments" ("department_id" serial NOT NULL, "name" character varying(100) NOT NULL, "location" character varying(100) NULL, PRIMARY KEY ("department_id"));
-- Create "employees" table
CREATE TABLE "company"."employees" ("employee_id" serial NOT NULL, "first_name" character varying(50) NOT NULL, "last_name" character varying(50) NOT NULL, "email" character varying(100) NOT NULL, "phone_number" character varying(15) NULL, "hire_date" date NOT NULL, "department_id" integer NULL, "salary" numeric(10,2) NULL, "job_title" character varying(50) NULL, PRIMARY KEY ("employee_id"), CONSTRAINT "employees_email_key" UNIQUE ("email"), CONSTRAINT "employees_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "company"."departments" ("department_id") ON UPDATE NO ACTION ON DELETE SET NULL);
-- Create "projects" table
CREATE TABLE "company"."projects" ("project_id" serial NOT NULL, "name" character varying(100) NOT NULL, "start_date" date NULL, "end_date" date NULL, "budget" numeric(12,2) NULL, PRIMARY KEY ("project_id"));
-- Create "employee_projects" table
CREATE TABLE "company"."employee_projects" ("employee_id" integer NOT NULL, "project_id" integer NOT NULL, "role" character varying(50) NULL, PRIMARY KEY ("employee_id", "project_id"), CONSTRAINT "employee_projects_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "company"."employees" ("employee_id") ON UPDATE NO ACTION ON DELETE CASCADE, CONSTRAINT "employee_projects_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "company"."projects" ("project_id") ON UPDATE NO ACTION ON DELETE CASCADE);
