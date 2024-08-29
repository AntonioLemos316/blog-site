import express from 'express'
import morgan from 'morgan'
import ManutencaoMiddleware from './middlewares/manutencaoMiddleware.js'

const app = express()
const PORT = 3000
const estaDisponivel = true
const manutencaoMiddleware = new ManutencaoMiddleware(estaDisponivel)

app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(morgan(':method :url :status :res[content-length] - :response-time ms'))
app.use((req, res, next) => manutencaoMiddleware.verificandoDisponibilidade(req, res, next))

app.get('/', (req, res) => {
    res.status(200).json({message: 'API funcionando!'})
})

app.listen(PORT, () => console.log(`API, rodando em http://localhost:${PORT}`))
