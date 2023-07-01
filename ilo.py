import requests
print("nimi seme?")
word = input()

def get_word_definition(word):
    url = "https://linku.la/jasima/data.json"
    response = requests.get(url)
    data = response.json()
    
    if "data" in data:
        for entry in data["data"].values():
            if entry["word"] == word:
                if "def" in entry:
                    if "en" in entry["def"]:
                        return entry["def"]["en"]
    
    return None

# Example usage
definition = get_word_definition(word)
if definition:
    print()
    print(word,":")
    print(definition,"(en)")
else:
    print("mi sona ala e '{word}' a!")
