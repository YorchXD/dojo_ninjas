# Comandos para la aplicacion

### Crear modelo dojo y ninja
* rails g model dojo name:string city:string state:string
* Nota: se debe realizar la migracion primero para realizar la referencia que viene en el siguiente punto (comando: **_rails db:migrate_**)
* rails g model ninja first_name:string last_name:string dojo:references

### Creacion de dojos
* Dojo.create(name:"CodingDojo Silicon Valley", city:"Mountain View", state:"CA")
* Dojo.create(name:"CodingDojo Seattle", city:"Seattle", state:"WA")
* Dojo.create(name:"CodingDojo New York", city:"New York", state:"NY")

### Creacion de Ninja
* Ninja.create(first_name:"Cristian", last_name:"Uribe",dojo_id:1)
* Ninja.create(first_name:"Gaby", last_name:"Rodriguez",dojo_id:1)
* Ninja.create(first_name:"Sthephanie", last_name:"Jimenez",dojo_id:1)

* Ninja.create(first_name:"Patricio", last_name:"Leyton",dojo_id:2)
* Ninja.create(first_name:"Carlos", last_name:"Rodriguez",dojo_id:2)
* Ninja.create(first_name:"Yesenia", last_name:"Quezada",dojo_id:2)

* Ninja.create(first_name:"Jose", last_name:"Garcia",dojo_id:3)
* Ninja.create(first_name:"Rosmery", last_name:"Gonzalez",dojo_id:3)
* Ninja.create(first_name:"Jorge", last_name:"Martin",dojo_id:3)

### Creacion Dojos con comando new
* dojo = Dojo.new(name:"CodingDojo Silicon Valley", city:"Mountain View", state:"CA")
* dojo.save

### Eliminacion de dojo
* Dojo.find(4).destroy

### Validaciones de dojo
* Dojo.create!(name:"", city:"", state:"")
```
C:/Ruby31-x64/lib/ruby/gems/3.1.0/gems/activerecord-6.1.6.1/lib/active_record/validations.rb:80:in `raise_validation_error': Validation failed: Name can't be blank, City can't be blank, State can't be blank, State is the wrong length (should be 2 characters) (ActiveRecord::RecordInvalid)
```

### Obtner ninjas de cualquier dojo
* Dojo.find(1).ninjas

### Obtner ninjas del segundo dojo en orden descendiente 
* Dojo.find(2).ninjas.order("created_at desc")

### Al modificar el modelo dojo y eliminar el dojo con id 2 el resultado da lo siguiente:
* Comando: Dojo.find(2).destroy
* Respuesta: 
``` 
(1.7ms)  SELECT sqlite_version(*)
Dojo Load (0.5ms)  SELECT "dojos".* FROM "dojos" WHERE "dojos"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
TRANSACTION (0.1ms)  begin transaction
Ninja Load (0.2ms)  SELECT "ninjas".* FROM "ninjas" WHERE "ninjas"."dojo_id" = ?  [["dojo_id", 2]]
Ninja Destroy (14.1ms)  DELETE FROM "ninjas" WHERE "ninjas"."id" = ?  [["id", 4]]
Ninja Destroy (0.1ms)  DELETE FROM "ninjas" WHERE "ninjas"."id" = ?  [["id", 5]]
Ninja Destroy (0.2ms)  DELETE FROM "ninjas" WHERE "ninjas"."id" = ?  [["id", 6]]
Dojo Destroy (0.2ms)  DELETE FROM "dojos" WHERE "dojos"."id" = ?  [["id", 2]]   
TRANSACTION (7.6ms)  commit transaction
=>
#<Dojo:0x0000020e91ec6750
 id: 2,
 name: "CodingDojo Seattle",
 city: "Seattle",
 state: "WA",
 created_at: Tue, 26 Jul 2022 01:14:51.679427000 UTC +00:00,
 updated_at: Tue, 26 Jul 2022 01:14:51.679427000 UTC +00:00>
```