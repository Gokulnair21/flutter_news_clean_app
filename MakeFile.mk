#Builds generated files
generate_code:
	@echo "*********************GETTING/UPDATING DEPENDENCIES*********************"
	flutter pub get
	@echo  "********************GENERATING THE FILES*******************"
	flutter packages pub run build_runner build --delete-conflicting-outputs

#Package upgrade
upgrade_dependencies:
	@echo "*****************UPGRADING DEPENDENCIES*******************"
	flutter packages upgrade

#Cleans the entire generated files and the flutter cache and will rebuild the project
clean_and_rebuild:
	@echo "*****************REMOVING GENERATED CODE*******************"
	flutter pub run build_runner clean
	@echo "*****************REMOVING BUILD FILES*******************"
	flutter clean
	@echo "*********************GETTING/UPDATING DEPENDENCIES*********************"
	flutter pub get
	@echo  "********************GENERATING THE FILES*******************"
	flutter packages pub run build_runner build
	@echo "****************RUNNING THE PROJECT****************"
	flutter run