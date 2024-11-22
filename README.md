# Sistema de Banco de Dados para Oficina Mecânica

Este projeto consiste em um modelo lógico de banco de dados projetado para atender às necessidades de uma oficina mecânica. Ele foi desenvolvido para gerenciar clientes, veículos, ordens de serviço (OS), serviços realizados, peças utilizadas e funcionários envolvidos.

---

## 📋 Estrutura do Banco de Dados

### Entidades Principais
1. **Clientes**  
   Armazena as informações dos clientes, como nome, CPF, telefone e e-mail.

2. **Veículos**  
   Relaciona os veículos aos seus respectivos proprietários. Contém informações como placa, modelo, marca e ano.

3. **Funcionários**  
   Gerencia os dados dos funcionários da oficina, incluindo nome, CPF, cargo e telefone.

4. **Serviços**  
   Lista os serviços disponíveis na oficina, com suas descrições e preços.

5. **Ordens de Serviço (OS)**  
   Gerencia as ordens de serviço, incluindo status, datas de entrada e saída, veículo associado e o funcionário responsável.

6. **Itens da OS**  
   Registra os serviços realizados em uma OS, incluindo quantidade e valor total.

7. **Peças**  
   Contém o catálogo de peças disponíveis com suas descrições e valores unitários.

8. **Itens de Peças na OS**  
   Detalha as peças utilizadas em cada OS, incluindo quantidade e valor total.

---

## 🔄 Relacionamentos
- **Clientes ↔ Veículos**: Um cliente pode possuir vários veículos (1:N).
- **Ordens de Serviço ↔ Veículos**: Cada OS é associada a um único veículo, mas um veículo pode ter várias OSs (1:N).
- **Ordens de Serviço ↔ Funcionários**: Uma OS é gerenciada por um único funcionário, mas um funcionário pode gerenciar várias OSs (1:N).
- **Serviços ↔ Itens da OS**: Uma OS pode ter vários serviços, e cada serviço pode aparecer em várias OSs (N:N).
- **Peças ↔ Itens de Peças na OS**: Uma OS pode usar várias peças, e cada peça pode ser usada em diferentes OSs (N:N).

---

## 🛠️ Requisitos
- **Banco de Dados**: MySQL ou qualquer outro sistema compatível com SQL.
- **Ferramenta de Gerenciamento**: MySQL Workbench, DBeaver, ou equivalente.

---

## 📂 Estrutura de Tabelas
### Principais Tabelas:
1. **Clientes**
   - `ClienteID` (PK)
   - `Nome`
   - `CPF`
   - `Telefone`
   - `Email`

2. **Veículos**
   - `VeiculoID` (PK)
   - `Placa`
   - `Modelo`
   - `Marca`
   - `Ano`
   - `ClienteID` (FK)

3. **Funcionários**
   - `FuncionarioID` (PK)
   - `Nome`
   - `CPF`
   - `Cargo`
   - `Telefone`

4. **Serviços**
   - `ServicoID` (PK)
   - `Descricao`
   - `Preco`

5. **Ordens de Serviço**
   - `OSID` (PK)
   - `DataEntrada`
   - `DataSaida`
   - `Status`
   - `VeiculoID` (FK)
   - `FuncionarioID` (FK)

6. **Itens da OS**
   - `ItemOSID` (PK)
   - `OSID` (FK)
   - `ServicoID` (FK)
   - `Quantidade`
   - `ValorTotal`

7. **Peças**
   - `PecaID` (PK)
   - `Descricao`
   - `ValorUnitario`

8. **Itens de Peças na OS**
   - `ItemPecaOSID` (PK)
   - `OSID` (FK)
   - `PecaID` (FK)
   - `Quantidade`
   - `ValorTotal`

---

## 🛳️ Como Usar
1. **Criação do Banco de Dados**  
   Execute o script SQL fornecido (`database.sql`) para criar as tabelas e os relacionamentos.

2. **Inserção de Dados**  
   Popule as tabelas com os dados iniciais utilizando comandos `INSERT`.

3. **Consultas**  
   Use comandos `SELECT` para recuperar informações como:
   - Clientes com seus veículos.
   - Serviços realizados em uma OS específica.
   - Peças utilizadas em todas as OSs.

4. **Manutenção**  
   Atualize os dados usando `UPDATE` e remova registros desnecessários com `DELETE`.

---

## 📈 Exemplos de Consultas
### 1. Listar OSs ativas:
```sql
SELECT * FROM OrdensServico WHERE Status = 'Ativa';
