from docx import Document
import re
# Nom du fichier Word d'entrée
input_docx = "logs.docx"

# Ouvrir le fichier Word d'entrée
doc = Document(input_docx)

# Expression régulière pour rechercher les paragraphes
extracted_paragraphs = []

# Parcourir le document Word
for paragraph in doc.paragraphs:
    if('itemsPerPage' in str(paragraph.text)):
        print(paragraph.text)
        extracted_paragraphs.append(paragraph.text)

print(len(extracted_paragraphs))
#     print(paragraph)

# Enregistrer les paragraphes extraits dans un fichier texte
with open("paragraphes_extraits.txt", "w") as output_file:
    for paragraph in extracted_paragraphs:
        output_file.write(paragraph + "\n")