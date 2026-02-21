//
//  ContentView.swift
//  PrimeiroProjeto
//
//  Created by Maelyson Machado Pinheiro on 14/02/26.
//

import SwiftUI

struct ContentView: View {
    
    func registrar() {
        if !nome.isEmpty {
            pessoas.append(Pessoa(nome: nome))
            nome = ""
        }
    }
    
    @State private var nome = ""
    @State private var pessoas: [Pessoa] = []
    
    var body: some View {
        List {
            Text("Total de Pessoas Cadastradas: \(pessoas.count)")
            TextField("Adicione Seu Nome:", text: $nome)
                .padding()
            
            Button("Registrar",action: registrar)
            .padding(10)
            .background(Color.green)
            .cornerRadius(10)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .disabled(nome.isEmpty)
            
            ForEach(pessoas) { item in
                Text(item.nome)
            }
            .onDelete { indexSet in
                pessoas.remove(atOffsets: indexSet)
            }
            
            if pessoas.isEmpty {
                Text("Nenhum Nome Registrado")
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}

