Imports Nethereum.Web3
Imports Nethereum.Hex.HexTypes
Imports Nethereum.RPC.Eth.DTOs
Imports Newtonsoft.Json

Public Class DefaultAsp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Async Sub Button1_Click(sender As Object, e As EventArgs) Handles runButton.Click
        outputLabel.Text = ""
        Dim blockAmount As Integer = Integer.Parse(inputBox.Text)

        Dim web3 = New Web3("https://kovan.infura.io/v3/054531499f91402fb4093e81f66984fa")

        Dim currentBlockNumber = Await web3.Eth.Blocks.GetBlockNumber.SendRequestAsync()

        Dim blockArray As ArrayList = New ArrayList()

        For i As Integer = 1 To blockAmount
            Dim block As BlockWithTransactions
            Try
                block = Await web3.Eth.Blocks.GetBlockWithTransactionsByNumber.SendRequestAsync(currentBlockNumber)
                blockArray.Add(block)
            Catch ex As Exception
                outputLabel.Text = ""
                outputLabel.Text = ex.StackTrace
            End Try
            currentBlockNumber = New HexBigInteger(currentBlockNumber.Value - 1)

        Next
        For Each j As BlockWithTransactions In blockArray
            outputLabel.Text &= JsonConvert.SerializeObject(j, Formatting.None)
        Next

    End Sub
End Class