# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170403160024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicant_details", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phonenumber"
    t.string   "location"
    t.integer  "experience"
    t.integer  "min_salary"
    t.integer  "max_salary"
    t.integer  "requirement_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "job_title"
    t.boolean  "accept",               default: false
    t.text     "reason_for_rejection"
    t.string   "attachment"
    t.string   "sent_by"
    t.integer  "company_id"
  end

  add_index "applicant_details", ["company_id"], name: "index_applicant_details_on_company_id", using: :btree
  add_index "applicant_details", ["requirement_id"], name: "index_applicant_details_on_requirement_id", using: :btree

  create_table "applicant_details_job_types", id: false, force: :cascade do |t|
    t.integer "applicant_detail_id"
    t.integer "job_type_id"
  end

  add_index "applicant_details_job_types", ["applicant_detail_id", "job_type_id"], name: "applicant_and_job", unique: true, using: :btree

  create_table "applicant_details_qualifications", id: false, force: :cascade do |t|
    t.integer "applicant_detail_id"
    t.integer "qualification_id"
  end

  add_index "applicant_details_qualifications", ["applicant_detail_id", "qualification_id"], name: "applicant_qualification", unique: true, using: :btree

  create_table "applicant_details_skills", id: false, force: :cascade do |t|
    t.integer "applicant_detail_id"
    t.integer "skill_id"
  end

  add_index "applicant_details_skills", ["applicant_detail_id", "skill_id"], name: "applicant_skills", unique: true, using: :btree

  create_table "children_details", force: :cascade do |t|
    t.string   "name"
    t.datetime "birthdate"
    t.string   "school"
    t.integer  "employee_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "update_button", default: false
  end

  add_index "children_details", ["employee_id"], name: "index_children_details_on_employee_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phonenumber"
    t.string   "name"
    t.string   "auth_code"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "compulsory_requirements", force: :cascade do |t|
    t.text     "requirement_1"
    t.text     "requirement_2"
    t.text     "requirement_3"
    t.text     "requirement_4"
    t.text     "requirement_5"
    t.text     "requirement_6"
    t.text     "requirement_7"
    t.text     "requirement_8"
    t.text     "requirement_9"
    t.text     "requirement_10"
    t.integer  "requirement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "compulsory_requirements", ["requirement_id"], name: "index_compulsory_requirements_on_requirement_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "educational_qualifications", force: :cascade do |t|
    t.string   "institution"
    t.string   "certificate"
    t.datetime "enrolled_at"
    t.datetime "completed_at"
    t.integer  "employee_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "update_button", default: false
  end

  add_index "educational_qualifications", ["employee_id"], name: "index_educational_qualifications_on_employee_id", using: :btree

  create_table "employee_histories", force: :cascade do |t|
    t.string   "organization"
    t.string   "position"
    t.datetime "from"
    t.datetime "to"
    t.text     "reason_for_leaving"
    t.integer  "employee_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "employee_histories", ["employee_id"], name: "index_employee_histories_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "applicant_detail_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "surname"
    t.string   "middlename"
    t.string   "firstname"
    t.datetime "birthdate",           default: '2017-04-03 16:07:34'
    t.string   "marital_status"
    t.string   "gender"
    t.string   "birthplace"
    t.string   "region"
    t.string   "country"
    t.datetime "commencement_date",   default: '2017-04-03 16:07:34'
    t.string   "position"
    t.string   "department"
    t.string   "postal_address"
    t.string   "city"
    t.string   "house_number"
    t.string   "office_number"
    t.string   "mobile_number"
    t.string   "email_address"
    t.string   "corporate_email"
    t.string   "profile_status",      default: "INCOMPLETE"
    t.boolean  "sent",                default: false
  end

  add_index "employees", ["applicant_detail_id"], name: "index_employees_on_applicant_detail_id", using: :btree
  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree

  create_table "employment_histories", force: :cascade do |t|
    t.string   "organization"
    t.string   "position"
    t.datetime "from"
    t.datetime "to"
    t.text     "reason_for_leaving"
    t.integer  "employee_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "update_button",      default: false
  end

  add_index "employment_histories", ["employee_id"], name: "index_employment_histories_on_employee_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "brief_description"
    t.integer  "applicant_detail_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "interview_date"
    t.datetime "test_date"
    t.string   "confirm",             default: "Not Confirmed"
    t.string   "sent_by"
    t.string   "scheduler"
    t.string   "interview_results",   default: "PENDING"
    t.integer  "company_id"
  end

  add_index "events", ["applicant_detail_id"], name: "index_events_on_applicant_detail_id", using: :btree
  add_index "events", ["company_id"], name: "index_events_on_company_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "company_name"
    t.string   "job_title"
    t.string   "location"
    t.text     "description"
    t.integer  "applicant_detail_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "experiences", ["applicant_detail_id"], name: "index_experiences_on_applicant_detail_id", using: :btree

  create_table "job_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_types_requirements", id: false, force: :cascade do |t|
    t.integer "job_type_id"
    t.integer "requirement_id"
  end

  add_index "job_types_requirements", ["job_type_id", "requirement_id"], name: "job_and_requirements", unique: true, using: :btree

  create_table "next_of_kins", force: :cascade do |t|
    t.string   "name"
    t.string   "relationship"
    t.string   "phonenumber"
    t.string   "address"
    t.integer  "employee_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "update_button", default: false
  end

  add_index "next_of_kins", ["employee_id"], name: "index_next_of_kins_on_employee_id", using: :btree

  create_table "parent_details", force: :cascade do |t|
    t.string   "name"
    t.datetime "birthdate"
    t.string   "status",        default: "alive"
    t.integer  "employee_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "update_button", default: false
  end

  add_index "parent_details", ["employee_id"], name: "index_parent_details_on_employee_id", using: :btree

  create_table "qualifications", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications_requirements", id: false, force: :cascade do |t|
    t.integer "qualification_id"
    t.integer "requirement_id"
  end

  add_index "qualifications_requirements", ["qualification_id", "requirement_id"], name: "qualifications_req", unique: true, using: :btree

  create_table "recruiters", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "recruiters", ["email"], name: "index_recruiters_on_email", unique: true, using: :btree
  add_index "recruiters", ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true, using: :btree

  create_table "requests", force: :cascade do |t|
    t.string   "fullname"
    t.string   "phonenumber"
    t.string   "email"
    t.string   "company"
    t.string   "job_title"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "contacted",      default: false
    t.boolean  "accepted_offer"
  end

  create_table "requirements", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.integer  "experience"
    t.decimal  "min_salary"
    t.decimal  "max_salary"
    t.integer  "number_of_vacancies"
    t.integer  "company_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "note"
    t.datetime "sent"
    t.integer  "vacancies_left",      default: 0
  end

  add_index "requirements", ["company_id"], name: "index_requirements_on_company_id", using: :btree

  create_table "requirements_skills", id: false, force: :cascade do |t|
    t.integer "requirement_id"
    t.integer "skill_id"
  end

  add_index "requirements_skills", ["requirement_id", "skill_id"], name: "index_requirements_skills_on_requirement_id_and_skill_id", unique: true, using: :btree

  create_table "salary_details", force: :cascade do |t|
    t.string   "bankname"
    t.string   "branch"
    t.string   "account_number"
    t.string   "account_name"
    t.string   "ssnit_number"
    t.integer  "employee_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "update_button",  default: false
  end

  add_index "salary_details", ["employee_id"], name: "index_salary_details_on_employee_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.boolean  "skills_check",                                    default: false
    t.boolean  "qualifications_check",                            default: false
    t.string   "skills_note"
    t.string   "qualifications_note"
    t.decimal  "skills_score",                                    default: 0.0
    t.decimal  "qualifications_score",                            default: 0.0
    t.integer  "applicant_detail_id"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.boolean  "requirement_1_check"
    t.boolean  "requirement_2_check"
    t.boolean  "requirement_3_check"
    t.boolean  "requirement_4_check"
    t.boolean  "requirement_5_check"
    t.boolean  "requirement_6_check"
    t.boolean  "requirement_7_check"
    t.boolean  "requirement_8_check"
    t.boolean  "requirement_9_check"
    t.boolean  "requirement_10_check"
    t.decimal  "requirement_1_score"
    t.decimal  "requirement_2_score"
    t.decimal  "requirement_3_score"
    t.decimal  "requirement_4_score"
    t.decimal  "requirement_5_score"
    t.decimal  "requirement_6_score"
    t.decimal  "requirement_7_score"
    t.decimal  "requirement_8_score"
    t.decimal  "requirement_9_score"
    t.decimal  "requirement_10_score"
    t.decimal  "requirement_total_score", precision: 4, scale: 2
    t.decimal  "total_score",                                     default: 0.0
  end

  add_index "scores", ["applicant_detail_id"], name: "index_scores_on_applicant_detail_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spouse_details", force: :cascade do |t|
    t.string   "name"
    t.datetime "birthdate"
    t.string   "profession"
    t.string   "phonenumber"
    t.string   "address"
    t.integer  "employee_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "update_button", default: false
  end

  add_index "spouse_details", ["employee_id"], name: "index_spouse_details_on_employee_id", using: :btree

  add_foreign_key "applicant_details", "companies"
  add_foreign_key "applicant_details", "requirements"
  add_foreign_key "children_details", "employees"
  add_foreign_key "educational_qualifications", "employees"
  add_foreign_key "employee_histories", "employees"
  add_foreign_key "employees", "applicant_details"
  add_foreign_key "employees", "companies"
  add_foreign_key "employment_histories", "employees"
  add_foreign_key "events", "applicant_details"
  add_foreign_key "events", "companies"
  add_foreign_key "experiences", "applicant_details"
  add_foreign_key "next_of_kins", "employees"
  add_foreign_key "parent_details", "employees"
  add_foreign_key "requirements", "companies"
  add_foreign_key "salary_details", "employees"
  add_foreign_key "spouse_details", "employees"
end
