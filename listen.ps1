//BroadCast
$udp = New-Object System.Net.Sockets.UdpClient
$udp.Client.SetSocketOption([System.Net.Sockets.SocketOptionLevel]::Socket,
                            [System.Net.Sockets.SocketOptionName]::Broadcast, 1)

$msg = "ABC126,52.5200,13.4050,35000,180,450,1000,DLH4XY"
$data = [System.Text.Encoding]::ASCII.GetBytes($msg)

$udp.Send($data, $data.Length, "255.255.255.255", 9000)



//multicast

$group = "239.255.0.1"
$port = 9000

$udp = New-Object System.Net.Sockets.UdpClient
$udp.JoinMulticastGroup([IPAddress]::Parse($group))

$msg = "ABC123,52.5200,13.4050,35000,180,450,1000,DLH4XY"
$data = [System.Text.Encoding]::ASCII.GetBytes($msg)

$udp.Send($data, $data.Length, $group, $port)
