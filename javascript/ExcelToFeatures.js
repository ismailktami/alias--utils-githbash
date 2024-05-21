const {
	beforeRunHook,
	afterRunHook,
} = require("cypress-mochawesome-reporter/lib");
const path = require("path");
const XLSX = require("xlsx");
const fs = require("fs");

// const parseDatasMetarolesXlsxToJson = function () {
//   let tests = [];
//   const filePath = './cypress/fixtures/datas.metaroles.xlsx';
//   try {
//     const file_name = path.basename(filePath, 'xlsx');
//     const file = XLSX.readFile(filePath);
//     const sheetNames = file.SheetNames;
//     // for (let i = 0; i < file.SheetNames.length - 1; i++) {
//     //   let tempData = XLSX.utils.sheet_to_json(file.Sheets[sheetNames[i]], {
//     //     blankrows: false,
//     //     skipHidden: true,
//     //   });
//     //   tempData = tempData.filter(function (objet) {
//     //     return Array(
//     //       'component_name',
//     //       'component_selector',
//     //       'expected_state_internaluser_admin',
//     //       'expected_state_internaluser_full',
//     //       'expected_state_internaluser_restreint',
//     //     ).every(function (attribut) {
//     //       return objet.hasOwnProperty(attribut);
//     //     });
//     //   });
//     //   tests.push({ page_name: sheetNames[i].toString(), components: tempData });
//     // }
//     // fs.writeFileSync(`./cypress/fixtures/${file_name}json`, JSON.stringify(tests));

//     file.SheetNames.forEach((sheetName) => {
//       if (sheetName === 'DATA') return;
//       const worksheet = file.Sheets[sheetName];
//       const sheetData = XLSX.utils.sheet_to_json(worksheet);

//       // Générer le nom de fichier sans espaces
//       const featureFileName = sheetName.replace(/\s+/g, '') + '.feature';
//       const featureFilePath = path.join(
//         __dirname + '/../integration/AccessibilityMetaroles',
//         featureFileName,
//       );

//       // Construire le contenu du fichier .feature
//       let featureContent = `@MetaRoles\n@${sheetName.replace(/\s+/g, '')}\n`;
//       featureContent += `Feature: Check Component States for Different User Roles\n`;
//       featureContent += `  Scenario Outline: [${sheetName}] [<user_role>] Expect <component_name> to <expected_state>\n`;
//       featureContent += `    Given a "<user_role>" is logged\n`;
//       featureContent += `    When they navigate to the "Delivery Modes" page\n`;
//       featureContent += `    And Execute setup "<setup>"\n`;
//       featureContent += `    Then they should see the "<component_name>" in "<expected_state>"\n`;
//       featureContent += `    Examples:\n\n`;
//       featureContent += `      | user_role                            | setup                                | component_name                 | component_selector                               | expected_state |\n`;

//       // Ajouter les données de la feuille dans le fichier .feature
//       sheetData.forEach((row) => {
//         featureContent += `      | INTERNALUSER_FFMBACKOFFICE_ADMIN     | ${row.setup} | ${row.component_name} | ${row.component_selector} | ${row.expected_state_internaluser_admin}     |\n`;
//         featureContent += `      | INTERNALUSER_FFMBACKOFFICE_FULL      | ${row.setup} | ${row.component_name} | ${row.component_selector} | ${row.expected_state_internaluser_full}      |\n`;
//         featureContent += `      | INTERNALUSER_FFMBACKOFFICE_RESTREIN  | ${row.setup} | ${row.component_name} | ${row.component_selector} | ${row.expected_state_internaluser_restreint} |\n\n`;
//       });

//       // Écrire le contenu dans le fichier .feature
//       fs.writeFileSync(featureFilePath, featureContent, 'utf8');
//       return;
//     });
//   } catch (e) {
//     cy.log('A problem occurred while converting the data.metaroles.xlsx file to json');
//     throw e;
//   }
// };
