#import "@preview/ezexam:0.2.7": *
// #import "@preview/cetz:0.4.2": canvas, draw, tree
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/fancy-units:0.1.1": add-macros, fancy-units-configure, num, qty, unit

#show: setup.with(
    mode: EXAM,
)

#set document(
    title: "山东大学计算机科学与技术学院 24 数据、智能班计算机网络期末试题",
    author: "Arshtyi",
    date: datetime.today(),
)

#show link: it => {
    set text(fill: blue)
    underline(it)
}
#title[
    山东大学计算机科学与技术学院\

    24数据、智能班计算机网络期末试题
]

#notice(
    [出于方便使用#link("https://github.com/gbchu/ezexam", "gbchu/ezexam:0.2.7")作模板.],
    [源码:#link("https://github.com/Arshtyi/SDU-Computer-Networks").],
)

#let bytes = unit[Bytes]
#let ms = unit[ms]
#let Mbps = unit[Mbps]
#let kbps = unit[kbps]
#let MB = unit[MB]
#let km = unit[km]
#let mps = unit[m/s]
= 选择+填空
#question[
    哪些服务需要建立在TCP基础上 #paren[]
    #choices([电子邮件], [Web网页], [网络电话], [文件下载])
]
#question[
    TCP中,变量rwnd由#paren[]维护,变量cwnd由#paren[]维护
    #choices([发送方], [路由器], [交换机], [接收方])
]
#question[
    设$"rwnd"=5000 bytes$, $"cwnd"=8000 bytes$,$"RTT"=100 ms$,发送方的满载速率是#paren[]
]
#question[
    LAN下#paren[]识别硬件,传输层的#paren[]识别不同的应用进程
    #choices([IP地址], [MAC地址], [端口号], [子网掩码])
]
#question[
    传统电话网络中使用#paren[]交换技术
    #choices([电路], [软件], [分组], [硬件])
]
#question[
    设网络总带宽为$30 Mbps$,一共$10$个用户
    + 如果使用电路交换
        + $t_1$时刻,若有$4$个活跃用户,其中$1$个用户发送,则该用户的带宽为#paren[]
        + $t_2$时刻,若有$4$个活跃用户,其中$3$个用户发送,则他们的带宽均为#paren[]
    + 如果使用分组交换,$t_3$时刻所有用户的发送速率均为#paren[]
]
#question[
    TCP握手#paren[]次,挥手#paren[]次
]
#question[
    主机地址$173.168.120.16\/27$,子网#paren[]. 设ISP拥有地址块$128.119.40.192\/27$,将其划分为$4$个具有相同数量IP地址的子网,则他们分别为#paren[]#paren[]#paren[]#paren[]
]
#question[
    一个具有$20$台主机的LAN,并且呈现典型的突发(大部分时间空闲,少数时间同时发送),则适合使用#paren[]协议
    #choices([时分复用], [Polling轮询], [CSMA], [频分复用])
]
#question[
    在EWMA中,设$"EstimatedRTT"=100ms,alpha=0.125$
    + $"sampleRTT"_1=120ms$则$"EstimatedRTT"_1$=#paren[]
    + $"sampleRTT"_2=80ms$则$"EstimatedRTT"_2$=#paren[]
]
#question[
    当某网站因业务发展导致用户访问量激增，源站服务器面临巨大的处理压力和带宽瓶颈时，为了有效减轻源站负载、降低网络延迟并提高全球用户的访问响应速度，最适合采用的技术方案是#paren[]
    #choices([采用轮询机制], [使用CSMA协议], [增大TCP窗口], [部署内容分发网络(CDN)])
]
#question[
    ARP协议的作用是从#paren[]地址得到#paren[]地址
]
#question[
    设网络结构如图,其中边权为网络延迟

    #align(center)[
        #diagram(
            $
                                      & A edge("ld", 4)edge("d", 10) \
                B edge("d", 8)edge(2) & C edge("d", 1) \
                            D edge(2) & E
            $,
        )
    ]

    使用距离矢量算法(Bellman-Ford算法更新),初始各节点仅知晓与其邻居的距离
    + 一轮后,A到D的距离为#paren[]
    + 收敛后,A到E的距离为#paren[]
    + 需要#paren[]轮才能收敛
]
= 简答
#question[
    设网络结构如图
    #align(center)[
        #diagram(
            let edge = edge.with(label-side: center),
            $
                                                   & z edge("ld", 8)edge("d", 12) \
                x edge(6)edge("d", 6)edge("rd", 3) & y edge("d", 8)edge(7)        & t edge("d", 2)edge("ld", 4) \
                                         w edge(4) & v edge(3)                    &                           u
            $,
            // edge((2, 2), "d,ll,u", 3),
            edge((0, 2), (2, 2), 3, bend: -35deg),
        )
    ]
    从$t$出发,使用Dijkstra算法计算到其他节点$chi in {x,y,z,w,v,u}$的最短路径$D(chi)$和前驱节点$P(chi)$,并记录每一步的状态变化于下表

    #table(
        columns: 8,
        stroke: none,
        table.hline(y: 1, stroke: 1pt),
        table.header(
            [Step], [$N$], [$D(x),P(x)$], [$D(y),P(y)$], [$D(z),P(z)$], [$D(w),P(w)$], [$D(v),P(v)$], [$D(u),P(u)$]
        ),
        [$0$], [$t$],
    )
]
#question[
    设主机$A,B$正通过TCP连接传输数据,$B$已经收到了序号$126$及其之前的所有数据,并向$A$发送了确认号$127$.$A$预期要发送的接下来$3$个数据包大小依次为$80,40,60bytes$.其中数据包$1$的源端口号为$302$,目的端口号为$80$.采用基于累积确认的机制,不考虑SACK.$B$每收到一个数据包后,立即发送一个确认号给$A$.
    + 数据包$3$的序号、源端口号、目的端口号
    + 如果按照数据包$1 arrow.r 3 arrow.r 2$的顺序到达$B$，则$B$发送的确认号分别是多少
    + 基于(2),如果对数据包$1$的确认丢失，$A$什么情况下会触发重传,什么情况下不会触发重传
    + 如果数据包$1$丢失,$A$是否会触发fast retransmit,为什么
]
#question[
    设某路由器对8位二进制地址有如下基于前缀的端口规则
    // #table(
    //     columns: 2,
    //     table.header([前缀], [端口]),
    //     [00], [0],
    //     [010], [1],
    //     [011], [2],
    //     [10], [2],
    //     [11], [3],
    // )
    #align(center)[
        #table(
            columns: 6,
            table.header([地址], [00], [010], [011], [10], [11]),
            [端口], [0], [1], [2], [2], [3],
        )
    ]
    给出这四个端口各自的地址范围和数量.
]
#question[
    设某链路如图

    #align(center)[
        #diagram(
            $
                "主机A"edge(1) & "路由A"edge(2) & "路由B"edge(3) & "主机B"
            $,
        )
    ]

    其中三条链路的带宽依次为$500kbps,4Mbps,1Mbps$
    + 吞吐量是多少
    + 如果$"主机A"$向$"主机B"$发送一个$4MB$的文件,忽略其他所有的开销,传输该文件需要多长时间
    + 如果$"主机A"$向$"主机B"$发送一个$2500bytes$的文件,路由的处理时延均为$3ms$,三条链路长度分别为$#num[5e3]km,#num[4e3]km,#num[1e3]km$,传播速度为$#num[2.5e8 ] mps$,传输该文件需要多长时间
]
#question[
    设以下情形
    #align(center)[
        #diagram(
            spacing: (5mm, 2mm),
            node-inset: 1pt,
            $
                "应用程序A" &        & "应用程序B" \
                          5 &        &           5 \
                          4 &        &           4 \
                          3 &        &           3 \
                          2 &        &           2 \
                          1 &        &           1 \
                     edge() & edge()
            $,
        )
    ]

    + 图中$1-5$中各层的名称
    + 设应用程序$A$要向应用程序$B$发送一段数据,请简述整个过程
]
#question[
    请分别以箭头+序号形式给出迭代查询和递归查询的过程

    #align(center)[
        #diagram(
            $
                                 "根服务器" & "顶级域服务器" \
                "本地域服务器" edge("d", 1) & "权威域服务器" \
                                     "主机"
            $,
        )
    ]
]
#question[
    设某网络的结构如下,其中$P_i$代表第$i$个IP地址,$M_i$代表第$i$个MAC地址
    #align(center)[
        #diagram({
            let edge = edge.with(label-pos: 0.1)
            let t(content) = text(size: 8pt, content)
            node((0, 0), "主机1")
            edge("rd", t("P1/M1"), right)
            node((1, 0), "主机2")
            edge("d", t("P2/M2"))
            node((2, 0), "主机3")
            edge("ld", t("P3/M3"), left)
            node((1, 1), "交换机1")
            edge("d")
            node((1, 2), "路由器1")
            edge("u", t("P4/M4"))
            edge("ld", t("P5/M5"))
            edge("rd", t("P6/M6"))
            node((0, 3), "路由器2")
            edge("ru", t("P7/M7"))
            edge(t("P8/M8"), right)
            edge("d", t("P9/M9"))
            node((2, 3), "路由器3")
            edge("l", t("P10/M10"), left)
            edge("lu", t("P11/M11"))
            edge("d", t("P12/M12"), left)
            node((0, 4), "交换机2")
            node((2, 4), "交换机3")
            node((-1, 5), "主机4")
            edge("ru", t("P13/M13"))
            node((0, 5), "主机5")
            edge("u", t("P14/M14"))
            node((2, 5), "主机6")
            edge("u", t("P15/M15"))
            node((3, 5), "主机7")
            edge("lu", t("P16/M16"))
        })
    ]

    + 此网络有多少个子网,分别包含哪些IP
    + 主机$1$发送数据给主机$4$过程为#diagram($ "主机1"edge("->") & "路由器1"edge("->") & "路由器2"edge("->") & "主机4" $) 列出该过程每一步的源IP地址、目的IP地址、源MAC地址、目的MAC地址
    + 若主机$2$刚加入网络,它获得路由器$1$的IP地址和MAC地址分别使用什么协议
    + 如果主机$6,7$所在网络使用NAT(即$"P15","P16"$为内网IP, 路由器$3$运行NAT),主机$6$向主机$3$发送数据过程为#diagram($ "主机6"edge("->") & "路由器3"edge("->") & "路由器1"edge("->") & "主机3" $)列出该过程每一步的源IP地址、目的IP地址
    + 基于(4),如果主机$6,7$各自通过两条TCP连接与主机$3$的$80$端口通信(端口均为$3345,3346$),完善路由器$3$的NAT表的$4$条记录(端口$4000,4001,4002,4003$)#align(center)[
            #table(
                columns: 2,
                inset: (x: 10pt, y: 8pt),
                table.header([外网IP:端口], [内网IP:端口]),
                [], [],
                [], [],
                [], [],
                [], [],
            )
        ]
]
