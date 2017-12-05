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

ActiveRecord::Schema.define(version: 20171205162359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asignaciones", id: :bigint, default: -> { "nextval('asignacions_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "id_chofer"
    t.integer "id_bus"
    t.integer "id_empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "id_ruta"
    t.integer "id_horario"
  end

  create_table "buses", force: :cascade do |t|
    t.integer "num_maquina"
    t.string "placa_patente"
    t.integer "anio_vehiculo"
    t.string "marca"
    t.string "carroceria"
    t.string "numero_motor"
    t.string "numero_chasis"
    t.integer "id_categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria_buses", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choferes", id: :bigint, default: -> { "nextval('chofers_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "rut"
    t.string "nombres"
    t.string "apellido_pat"
    t.string "apellido_mat"
    t.date "fecha_ingreso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre"
    t.string "rut"
    t.integer "id_ruta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horarios", force: :cascade do |t|
    t.string "dia"
    t.string "periodo"
    t.datetime "hora_inicio"
    t.datetime "hora_termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rutas", id: :bigint, default: -> { "nextval('ruta_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "descripcion"
    t.string "recorrido"
    t.integer "id_empresa"
    t.integer "id_horario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "asignaciones", "buses", column: "id_bus"
  add_foreign_key "asignaciones", "choferes", column: "id_chofer"
  add_foreign_key "asignaciones", "empresas", column: "id_empresa"
  add_foreign_key "asignaciones", "horarios", column: "id_horario"
  add_foreign_key "asignaciones", "rutas", column: "id_ruta"
  add_foreign_key "buses", "categoria_buses", column: "id_categoria"
  add_foreign_key "empresas", "rutas", column: "id_ruta"
  add_foreign_key "rutas", "empresas", column: "id_empresa"
  add_foreign_key "rutas", "horarios", column: "id_horario"
end
