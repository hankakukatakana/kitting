
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms


function Get-UrlsFromJson {
    param (
        [string]$JsonFilePath
    )
    # JSONファイルを読み取り、配列に変換
    $data = Get-Content $JsonFilePath | ConvertFrom-Json
    # 配列内の各オブジェクトからURLを取得して返す
    $urls = $data | ForEach-Object { $_.url }
    return $urls
}

# JSONファイルからURLを取得
$urls = Get-UrlsFromJson -JsonFilePath ""I:\kitting\App\install.json""

# 取得したURLを表示
$urls

#-----UI-------
$Form = New-Object System.Windows.Forms.Form
	$Form.Size = New-Object System.Drawing.Size(500,500)
	$Form.Text = "Kitting tool"

$Ckbox = New-Object System.Windows.Forms.CheckedListBox
$Ckbox.Dock = [System.Windows.Forms.DockStyle]::Fill
$array = @("test1","test2","test3","test4")
foreach($item in $array){
    $Ckbox.Items.Add($item)
}
$Form.Controls.Add($Ckbox)

$DateBtn = New-Object System.Windows.Forms.Button
	$DateBtn.Location = New-Object System.Drawing.Point(0,300)
	$DateBtn.Size = New-Object System.Drawing.Size(100,30)
	$DateBtn.Text = "Install"
$Form.Controls.Add($DateBtn)
$DateBtn.Add_Click({})

$TxtBtn = New-Object System.Windows.Forms.Button
	$TxtBtn.Location = New-Object System.Drawing.Point(100,300)
	$TxtBtn.Size = New-Object System.Drawing.Size(100,30)
	$TxtBtn.Text = "All Check"
$Form.Controls.Add($TxtBtn)
$TxtBtn.Add_Click({})

$ClearBtn = New-Object System.Windows.Forms.Button
	$ClearBtn.Location = New-Object System.Drawing.Point(200,300)
	$ClearBtn.Size = New-Object System.Drawing.Size(100,30)
	$ClearBtn.Text = "All Del"
$Form.Controls.Add($ClearBtn)
$ClearBtn.Add_Click({})

$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()
