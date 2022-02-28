Imports System.Net
Imports Newtonsoft.Json

Public Class DefaultAsp
    Inherits System.Web.UI.Page

    Private planetList As List(Of Planet) = New List(Of Planet)
    Dim nameSort As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim webClient As New WebClient
            Dim result As String = webClient.DownloadString("https://swapi.dev/api/planets/")
            Dim response = JsonConvert.DeserializeObject(Of Response)(result)
            While Not String.IsNullOrEmpty(response.next)
                For Each planet In response.results
                    PlanetList.Add(planet)
                Next
                result = webClient.DownloadString(response.next)
                response = JsonConvert.DeserializeObject(Of Response)(result)
            End While
            For Each planet In response.results
                PlanetList.Add(planet)
            Next
        Catch ex As Exception

        End Try

        Session("planetData") = JsonConvert.SerializeObject(planetList)
    End Sub
End Class