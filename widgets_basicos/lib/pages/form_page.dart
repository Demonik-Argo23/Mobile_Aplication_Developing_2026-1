import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}


class _FormPageState extends State<FormPage> {

  final TextEditingController fechaController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final formkey = GlobalKey<FormState>();
  String nombre = '';
  double telefono = 0;
  final List<String> departamentos = ['Recursos Humanos', 'Finanzas', 'Ventas', 'Marketing', 'IT'];
  String departamento = '';

  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.pinkAccent,
              onPrimary: Colors.white,
              surface: const Color.fromARGB(255, 255, 255, 255),
              onSurface: Colors.black,
            ),
          ), 
          child: child!
        );
      }
    );
    if (selected != null) {
      setState(() {
        selectedDate = selected;
        fechaController.text = "${selected.day}/${selected.month}/${selected.year}";
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de Registro", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Text("Registra tus datos"),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'El nombre es obligatorio';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Nombre completo",
                  hintText: "Ingresa tu nombre",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),

              SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'El número de teléfono es obligatorio';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Número de teléfono",
                  prefixText: '+52',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20,),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Departamento",
                  prefixIcon: Icon(Icons.apartment),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                initialValue: departamentos[0],
                items: departamentos.map((String dep){
                  return DropdownMenuItem(
                    value: dep,
                    child: Text(dep),
                  );
                }).toList(), 
                onChanged: (value){
                  setState(() {
                    departamento = value!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: fechaController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Fecha de nacimiento",
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onTap: () {
                  selectDate(context);
                },
              ),
              SizedBox(height: 60,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent
                ),
                onPressed: (){
                  if(formkey.currentState!.validate()){
                    formkey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Formulario enviado correctamente"))
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Formulario no valido"), backgroundColor: Colors.redAccent,)
                    );
                  }
                },
                child: Text("Enviar Formulario", style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),)
                )
            ],
          )
        ),
      ),
    );
  }
}