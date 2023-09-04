Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms

# JSONファイルからURLを取得
'
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
$urls = Get-UrlsFromJson -JsonFilePath "I:\kitting\App\testurl.json"
'
$urls = @(	
    "https://support.zoom.us/hc/ja/articles/207373866-Zoom-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%A9",
	"https://www.microsoft.com/ja-jp/microsoft-teams/download-app",
	"https://slack.com/intl/ja-jp/downloads/windows",
	"https://www.google.com/intl/ja/chrome/",
	"https://support.mozilla.org/ja/kb/how-download-and-install-firefox-windows?redirect=no",
	"https://vm-islo-m1.radix.ad.jp/users/main/downloads.html",
	"https://forest.watch.impress.co.jp/library/software/ipmsg/"
)
function OpenURL{
    foreach($url in $urls){
        Start-Process $url
    } 
}

#-----UI-------
$Form = New-Object System.Windows.Forms.Form
	$Form.Size = New-Object System.Drawing.Size(500,500)
	$Form.Text = "Kitting tool"
'
$Ckbox = New-Object System.Windows.Forms.CheckedListBox
$Ckbox.Dock = [System.Windows.Forms.DockStyle]::Fill

foreach($item in $urls){
    $Ckbox.Items.Add($item)
    $Ckbox.Size = New-Object System.Drawing.Size(200,30)
}
$Form.Controls.Add($Ckbox)
'
$Install = New-Object System.Windows.Forms.Button
	$Install.Location = New-Object System.Drawing.Point(0,300)
	$Install.Size = New-Object System.Drawing.Size(100,30)
	$Install.Text = "Install"
$Form.Controls.Add($Install)
$Install.Add_Click({OpenURL})

$AllCheck = New-Object System.Windows.Forms.Button
	$AllCheck.Location = New-Object System.Drawing.Point(100,300)
	$AllCheck.Size = New-Object System.Drawing.Size(100,30)
	$AllCheck.Text = "AllCheck"
$Form.Controls.Add($AllCheck)
$TxtBtn.Add_Click({})

$AllDel = New-Object System.Windows.Forms.Button
	$AllDel.Location = New-Object System.Drawing.Point(200,300)
	$AllDel.Size = New-Object System.Drawing.Size(100,30)
	$AllDel.Text = "All Del"
$Form.Controls.Add($AllDel)
$AllDel.Add_Click({})

$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()