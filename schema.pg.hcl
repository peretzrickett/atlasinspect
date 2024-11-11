table "departments" {
  schema = schema.company
  column "department_id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(100)
  }
  column "location" {
    null = true
    type = character_varying(100)
  }
  primary_key {
    columns = [column.department_id]
  }
}
table "employee_projects" {
  schema = schema.company
  column "employee_id" {
    null = false
    type = integer
  }
  column "project_id" {
    null = false
    type = integer
  }
  column "role" {
    null = true
    type = character_varying(50)
  }
  primary_key {
    columns = [column.employee_id, column.project_id]
  }
  foreign_key "employee_projects_employee_id_fkey" {
    columns     = [column.employee_id]
    ref_columns = [table.employees.column.employee_id]
    on_update   = NO_ACTION
    on_delete   = CASCADE
  }
  foreign_key "employee_projects_project_id_fkey" {
    columns     = [column.project_id]
    ref_columns = [table.projects.column.project_id]
    on_update   = NO_ACTION
    on_delete   = CASCADE
  }
}
table "employees" {
  schema = schema.company
  column "employee_id" {
    null = false
    type = serial
  }
  column "first_name" {
    null = false
    type = character_varying(50)
  }
  column "last_name" {
    null = false
    type = character_varying(50)
  }
  column "email" {
    null = false
    type = character_varying(100)
  }
  column "phone_number" {
    null = true
    type = character_varying(15)
  }
  column "hire_date" {
    null = false
    type = date
  }
  column "department_id" {
    null = true
    type = integer
  }
  column "salary" {
    null = true
    type = numeric(10,2)
  }
  column "job_title" {
    null = true
    type = character_varying(50)
  }
  primary_key {
    columns = [column.employee_id]
  }
  foreign_key "employees_department_id_fkey" {
    columns     = [column.department_id]
    ref_columns = [table.departments.column.department_id]
    on_update   = NO_ACTION
    on_delete   = SET_NULL
  }
  unique "employees_email_key" {
    columns = [column.email]
  }
}
table "projects" {
  schema = schema.company
  column "project_id" {
    null = false
    type = serial
  }
  column "name" {
    null = false
    type = character_varying(100)
  }
  column "start_date" {
    null = true
    type = date
  }
  column "end_date" {
    null = true
    type = date
  }
  column "budget" {
    null = true
    type = numeric(12,2)
  }
  primary_key {
    columns = [column.project_id]
  }
}
schema "company" {
}
schema "public" {
  comment = "standard public schema"
}
