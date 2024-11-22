CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    CPF VARCHAR(14) UNIQUE,
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Veiculos (
    VeiculoID INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(7) UNIQUE,
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    Ano INT,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    CPF VARCHAR(14) UNIQUE,
    Cargo VARCHAR(50),
    Telefone VARCHAR(15)
);

CREATE TABLE Servicos (
    ServicoID INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2)
);

CREATE TABLE OrdensServico (
    OSID INT PRIMARY KEY AUTO_INCREMENT,
    DataEntrada DATE,
    DataSaida DATE,
    Status VARCHAR(50),
    VeiculoID INT,
    FuncionarioID INT,
    FOREIGN KEY (VeiculoID) REFERENCES Veiculos(VeiculoID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
);

CREATE TABLE ItensOS (
    ItemOSID INT PRIMARY KEY AUTO_INCREMENT,
    OSID INT,
    ServicoID INT,
    Quantidade INT,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (OSID) REFERENCES OrdensServico(OSID),
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ServicoID)
);

CREATE TABLE Pecas (
    PecaID INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255),
    ValorUnitario DECIMAL(10, 2)
);

CREATE TABLE ItensPecasOS (
    ItemPecaOSID INT PRIMARY KEY AUTO_INCREMENT,
    OSID INT,
    PecaID INT,
    Quantidade INT,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (OSID) REFERENCES OrdensServico(OSID),
    FOREIGN KEY (PecaID) REFERENCES Pecas(PecaID)
);
