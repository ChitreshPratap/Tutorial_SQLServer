/*

1.	Stored Procedure VS Functions
2.	nvarchar VS char VS varchar
3.	Except VS Not In
4.	Inline-table values function VS Scalar functions
5.	Permanent table vs temporary table
6.	local temporary table vs global temporary table

7.	Derived Table Vs Sub Query
		Derived Tables
			must be enclosed within parenthesis and name is provided.
			can have one/multiple columns
			derived tables are used only in From clause of outer table.

		Sub-query 
			must be enclosed within parenthesis.
			sub-query can have only 1 colun.
			Sub-Query is used within where clause of outer table mainly to filter out certain rows returned in result set of outer query.

		
8.	CTE and Derived Tables
9.	Table Variable Vs Temporary tables


__
# -*- mode: python -*-
block_cipher = None

mainFilePath=r"C:\Users\csingh58\PycharmProjects\MetPANReportBuilder_DS"
iconPath=mainFilePath+r"\src\resources\appconfig\metIcon.ico"
exeName="MetGrdrTaskLauncher"

binaryFile=[
	("src/resources/bin/*","src/resources/bin"),
	("src/resources/bin/winsparkle/x64/*","src/resources/bin/winsparkle/x64"),
	("src/resources/bin/winsparkle/x86/*","src/resources/bin/winsparkle/x86")
            ]

dataFiles=[("src/resources/appconfig/*","src/resources/appconfig/"),
    ("src/resources/MetGRDRTaskLauncherUpdate/*","src/resources/MetGRDRTaskLauncherUpdate/"),
    ("src/resources/temp/*","src/resources/temp/"),
	("src/service/configuration/*.dat","src/service/configuration"),
	("*.xl*","./"),
	("src/SupportedDocuments/SOP/GRDR Load Form Task.docx","src/SupportedDocuments/SOP"),
	("src/SupportedDocuments/SOP/RS A20 INRECO P02 2019 PA Ceded Settlement MTD_Before Uploading.xlsx","src/SupportedDocuments/SOP"),
	("src/SupportedDocuments/SOP/RS A20 INRECO P02 2019 PA Ceded Settlement MTD_After Uploading.xlsx","src/SupportedDocuments/SOP"),
	("src/SupportedDocuments/SOP/A20_LoadFormTemplate09212020.xlsx","src/SupportedDocuments/SOP")
	]

a = Analysis(['GrdrTaskLauncher.py'],
             pathex=[mainFilePath],
             binaries=binaryFile,
             datas=dataFiles,
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)

exe = EXE(pyz,
          a.scripts,
          [],
          exclude_binaries=True,
          name=exeName,
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=True, icon=iconPath)

coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=True,
               name='GrdrTaskLauncher')
_____________________________________________


# -*- mode: python -*-
block_cipher = None

mainFilePath=r"C:\Users\csingh58\PycharmProjects\MetPANReportBuilder_DS"
exeName="MetGrdrTaskLauncher"
grdrTaskLauncherIcon=mainFilePath+r"\src\resources\appconfig\metIcon.ico"
extensionServiceIcon=mainFilePath+r"\src\resources\appconfig\appExtn.ico"


binaryFile=[
	("src/resources/bin/*","src/resources/bin"),
	("src/resources/bin/winsparkle/x64/*","src/resources/bin/winsparkle/x64"),
	("src/resources/bin/winsparkle/x86/*","src/resources/bin/winsparkle/x86")
            ]

dataFiles=[("src/resources/appconfig/*","src/resources/appconfig/"),
    ("src/resources/MetGRDRTaskLauncherUpdate/*","src/resources/MetGRDRTaskLauncherUpdate/"),
    ("src/resources/temp/*","src/resources/temp/"),
	("src/service/configuration/*.dat","src/service/configuration"),
	("*.xl*","./"),
	("src/SupportedDocuments/SOP/GRDR Load Form Task.docx","src/SupportedDocuments/SOP"),
	("src/SupportedDocuments/SOP/RS A20 INRECO P02 2019 PA Ceded Settlement MTD_Before Uploading.xlsx","src/SupportedDocuments/SOP"),
	("src/SupportedDocuments/SOP/RS A20 INRECO P02 2019 PA Ceded Settlement MTD_After Uploading.xlsx","src/SupportedDocuments/SOP"),
	("src/SupportedDocuments/SOP/A20_LoadFormTemplate09212020.xlsx","src/SupportedDocuments/SOP")
	]

aGrdrTaskLauncher = Analysis(['GrdrTaskLauncher.py'],
             pathex=[mainFilePath],
             binaries=binaryFile,
             datas=dataFiles,
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)

aDownloadLoadFormTemplateService = Analysis(['DownloadLoadFormTemplateService.py'],
             pathex=[mainFilePath],
             binaries=binaryFile,
             datas=dataFiles,
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)


aUploadLoadFormService = Analysis(['UploadLoadFormService.py'],
             pathex=[mainFilePath],
             binaries=binaryFile,
             datas=dataFiles,
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)

MERGE( (aGrdrTaskLauncher, 'GrdrTaskLauncher', 'GrdrTaskLauncher'), (aDownloadLoadFormTemplateService, 'DownloadLoadFormTemplateService', 'DownloadLoadFormTemplateService'), (aUploadLoadFormService, 'UploadLoadFormService', 'UploadLoadFormService') )


aGrdrTaskLauncher_pyz = PYZ(aGrdrTaskLauncher.pure, aGrdrTaskLauncher.zipped_data,
             cipher=block_cipher)
aGrdrTaskLauncher_exe = EXE(aGrdrTaskLauncher_pyz,
          aGrdrTaskLauncher.scripts,
          [],
          exclude_binaries=True,
          name=exeName,
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=True, icon=grdrTaskLauncherIcon)


coll = COLLECT(aGrdrTaskLauncher_exe,
               aGrdrTaskLauncher.binaries,
               aGrdrTaskLauncher.zipfiles,
               aGrdrTaskLauncher.datas,
               strip=False,
               upx=True,
               name='GrdrTaskLauncher')


aDownloadLoadFormTemplateService_pyz = PYZ(aDownloadLoadFormTemplateService.pure, aDownloadLoadFormTemplateService.zipped_data,
             cipher=block_cipher)

aDownloadLoadFormTemplateService_exe = EXE(aDownloadLoadFormTemplateService_pyz,
          aDownloadLoadFormTemplateService.scripts,
          [],
          exclude_binaries=True,
          name='DownloadLoadFormTemplateService',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=True, icon=extensionServiceIcon)

coll = COLLECT(aDownloadLoadFormTemplateService_exe,
               aDownloadLoadFormTemplateService.binaries,
               aDownloadLoadFormTemplateService.zipfiles,
               aDownloadLoadFormTemplateService.datas,
               strip=False,
               upx=True,
               name='DownloadLoadFormTemplateService')


aUploadLoadFormService_pyz = PYZ(aUploadLoadFormService.pure, aUploadLoadFormService.zipped_data,
             cipher=block_cipher)
aUploadLoadFormService_exe = EXE(aUploadLoadFormService_pyz,
          aUploadLoadFormService.scripts,
          [],
          exclude_binaries=True,
          name='UploadLoadFormService',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=True, icon=extensionServiceIcon)

coll = COLLECT(aUploadLoadFormService_exe,
               aUploadLoadFormService.binaries,
               aUploadLoadFormService.zipfiles,
               aUploadLoadFormService.datas,
               strip=False,
               upx=True,
               name='UploadLoadFormService')



_________________________________________

# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


pathEx=r"C:\Users\csingh58\PycharmProjects\MetPANReportBuilder_DS"
metIconPath=pathEx+r"\src\resources\appconfig\metIcon.ico"
metPanReportBuilderExeName='Met_Pan Report Builder DS'
grdrTaskLauncherExeName='GrdrTaskLauncher'

binaryFile=[
	("src/resources/bin/*","src/resources/bin"),
	("src/resources/bin/winsparkle/x64/*","src/resources/bin/winsparkle/x64"),
	("src/resources/bin/winsparkle/x86/*","src/resources/bin/winsparkle/x86")
            ]

dataFiles=[
    ("src/resources/appconfig/*","src/resources/appconfig/"),
    ("src/resources/MetGRDRTaskLauncherUpdate/*","src/resources/MetGRDRTaskLauncherUpdate/"),
    ("src/resources/temp/*","src/resources/temp/"),
	("src/resources/reports/*","src/resources/reports"),
	("src/service/configuration/*.dat","src/service/configuration"),

#collecting all sops
	("src/SupportedDocuments/SOP/*","src/SupportedDocuments/SOP")

#collecting all input files of activities
#	("src/SupportedDocuments/Flag1/R417_Deffered/Input/*","src/SupportedDocuments/Flag1/R417_Deffered/Input"),
#	("src/SupportedDocuments/Flag1/R418_Payout/Input/*","src/SupportedDocuments/Flag1/R418_Payout/Input"),
#	("src/SupportedDocuments/Flag1/R423_CBF/Input/*","src/SupportedDocuments/Flag1/R423_CBF/Input"),
#	("src/SupportedDocuments/Flag1/Settlement/CBF/Input/*","src/SupportedDocuments/Flag1/Settlement/CBF/Input"),
#	("src/SupportedDocuments/Flag1/Settlement/Deffered_Payout/Input/*","src/SupportedDocuments/Flag1/Settlement/Deffered_Payout/Input"),
#	("src/SupportedDocuments/Traveler/AXA/Input/Settlement/*","src/SupportedDocuments/Traveler/AXA/Input/Settlement"),
#	("src/SupportedDocuments/Traveler/Genre/Input/Settlement/*","src/SupportedDocuments/Traveler/Genre/Input/Settlement"),
#	("src/SupportedDocuments/Traveler/SwissRe/Input/Settlement/*","src/SupportedDocuments/Traveler/SwissRe/Input/Settlement")
	]



#hiddenImports=["src.userframes.reports.reportsdecorframe.R418PayoutMonthlyAccrualActivityFrameDecor",
#		"src.userframes.reports.reportsdecorframe.R423CBFMonthlyAccrualActivityFrameDecor",
#		"src.userframes.reports.reportsdecorframe.TravelerAXAFrameDecor"
#		]
#For the hidden imports :- Import till the .py file 

activityIds=[
	"BSCCadencyReportingGAAP",
	"BSCCadencyReportingSTAT",
	"GeorgiaPacificAlicAccrual",
	"GeorgiaPacificSettlement",
	    "InternationalPaperAccrual",
	    "InternationalPaperSettlement",
	"ATnTAccrual",
	"ATnTSettlement",
	"GoogleLTDSettlement",
	"GoogleLTDAccrual",
	"InrecoAccrual",
	"InrecoCashSettlement",
	"ArconicAccrual",
	"ArconicSettlement",
	"GeneralMotorAccrual",
	"GeneralMotorSettlement",
	"ClicAlianzTrustPayment"
	]

decorReportSpecsImportFormat="src.service.reports.{activityId}.{activityId}ReportSpecs"
decorFramesImportFormat="src.userframes.reports.reportsdecorframe.{activityId}FrameDecor"
activityInstanceImportFormat="src.service.reports.{activityId}.{activityId}"

decorReportSpecsImport=[decorReportSpecsImportFormat.format(activityId=id) for id in activityIds]
decorFramesImport=[decorFramesImportFormat.format(activityId=id) for id in activityIds]
activityInstanceImport=[activityInstanceImportFormat.format(activityId=id) for id in activityIds]

hiddenImports=decorReportSpecsImport+decorFramesImport+activityInstanceImport

a = Analysis(['ReportLauncher.py'],
             pathex=[pathEx],
             binaries=binaryFile,
             datas=dataFiles,
             hiddenimports=hiddenImports,
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)


GrdrTaskLauncher_a = Analysis(['GrdrTaskLauncher.py'],
             pathex=[pathEx],
             binaries=binaryFile,
             datas=dataFiles,
             hiddenimports=hiddenImports,
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)

MERGE( (a, 'Met_Pan Report Builder DS', 'Met_Pan Report Builder DS'), (GrdrTaskLauncher_a, 'GrdrTaskLauncher', 'GrdrTaskLauncher'))

pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)


exe = EXE(pyz,
          a.scripts,
          [],
          exclude_binaries=True,
          name='Met_Pan Report Builder DS',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=True, icon=metIconPath)

coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=True,
               upx_exclude=[],
               name=metPanReportBuilderExeName)


GrdrTaskLauncher_pyz = PYZ(GrdrTaskLauncher_a.pure, GrdrTaskLauncher_a.zipped_data,
             cipher=block_cipher)

GrdrTaskLauncher_exe = EXE(GrdrTaskLauncher_pyz,
          GrdrTaskLauncher_a.scripts,
          [],
          exclude_binaries=True,
          name='GrdrTaskLauncher',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=True, icon=metIconPath)

GrdrTaskLauncher_coll = COLLECT(GrdrTaskLauncher_exe,
               GrdrTaskLauncher_a.binaries,
               GrdrTaskLauncher_a.zipfiles,
               GrdrTaskLauncher_a.datas,
               strip=False,
               upx=True,
               name=grdrTaskLauncherExeName)


	

