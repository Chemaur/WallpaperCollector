echo "---------------------------------------"
echo "Script para juntar varias carpetas de"
echo "imagenes en una sola para poder poner los"
echo "fondos de pantalla aleatorios en Mac"
echo " - - - - - - - - - - - - - - - - - - "
echo "Lee las subcarpetas de ~/Pictures/Fondos"
echo "y genera enlaces duros en la carpeta _Todos"
echo " - - - - - - - - - - - - - - - - - - "
echo "~/Pictures/Fondos"
echo "    _Todos"
echo "    Carpeta_1"
echo "        Fichero_1"
echo "        ..."
echo "    ..."
echo " - - - - - - - - - - - - - - - - - - "
echo "Pulse intro para comenzar ..."
echo "---------------------------------------"
read aaa
# -------------------------------
# Save vars to use spaces
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
# -------------------------------
# Position
cd ~/Pictures/Fondos
# -------------------------------
# Make and clear output dir
if [ ! -d "_Todos" ]; then
	mkdir _Todos
fi
cd _Todos
rm *.*
cd ..
# -------------------------------
# Get folders
for f in *
do
	if [ -d $f ] && [ $f != _Todos ]
	then
		echo "Procesando carpeta --> $f"
		# Get files
		cd $f
		for g in *
		do
			if [ -f $g ]
			then
				ln $g ../_Todos/
			fi
		done
		cd ..
	fi
done
# -------------------------------
# Recover vars for spaces
IFS=$SAVEIFS
# -------------------------------
echo ""
echo "***********************************"
echo "* Acabado, pulse intro para salir *"
echo "***********************************"
read aaa
# -------------------------------
exit 0;