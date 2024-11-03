const { MongoClient } = require("mongodb");

async function main() {
    const uri = "mongodb://localhost:27017"; 
    const client = new MongoClient(uri);

    try {
        await client.connect();
        const database = client.db("myDatabase");
        const collection = database.collection("users"); 

        const name = "Teste"; 
        await collection.insertOne({ name });
        console.log(`Usuário "${name}" adicionado!`);

        const users = await collection.find().toArray();
        console.log("Usuários salvos:", users);
    } finally {
        await client.close();
    }
}

main().catch(console.error);
//colocar no arquivo app.js 
//node app.js
