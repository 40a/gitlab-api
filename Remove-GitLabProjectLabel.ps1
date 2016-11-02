﻿function Remove-GitLabProjectLabel
{
  <#
      .SYNOPSIS
      Remove a label
      .DESCRIPTION
      The Remove-gitlabProjectLabel deletes a label with a given name.
      .EXAMPLE
      Remove-GitLabProjectLabel -ProjectId 20 -Name 'type:bug'
      ---------------------------------------------------------------
      Removes the label 'type:bug' for project 20
  #>
  [CmdletBinding(
     SupportsShouldProcess=$true,
    ConfirmImpact="High")]
  [Alias()]
  [OutputType()]
  Param
  (
    # The ID of the project
    [Parameter(HelpMessage = 'ProjectID',
    Mandatory = $true)]
    [Alias('ProjectID')]
    [int]$id,

    # The name of the label
    [Parameter(HelpMessage = 'Label Name',
    Mandatory = $true)]
    [Alias()]
    [string]$Name,

    #Specify Existing GitlabConnector
    [Parameter(HelpMessage = 'Specify Existing GitlabConnector',
        Mandatory = $false,
    DontShow = $true)]
    [psobject]$GitlabConnect = (Get-GitlabConnect)
  )
  
  $httpmethod = 'delete'
  $apiurl = "projects/$id/labels"
  $parameters = @{
    name = $name
  }
if
  ($pscmdlet.ShouldProcess("[Label]$name","Remove")){
    $null = $GitlabConnect.callapi($apiurl,$httpmethod,$parameters)
  }
}
