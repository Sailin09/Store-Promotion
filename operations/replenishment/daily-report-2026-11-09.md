# 执行日报 2026-11-09

<!-- store-promotion-daily:2026-11-09 -->

北京时间 **11 月 8 日 10:00（含）至 11 月 9 日 10:00（不含）**：确认实际发布 **14 条唯一 Pin**，补货实际入库 **12 条**。核验时可用 **83 条**，32 条路线按每路线目标 **3 条**计算，共缺 **13 条**。以上一日报的逻辑截止库存对账：**85 + 12 − 14 = 83**；上一日报已另列的截止后 Pin，本期按真实时间计入一次。

本期续接上次成功截止，逻辑截止为 **11 月 9 日 10:00（02:00 UTC）**。截止前已读取仓库；截止后于 **10:00:01** 请求重跑只读核验，[新 Verify job](https://github.com/Sailin09/Store-Promotion/actions/runs/42504458059/job/128938535112) 的数据库审计时间为 **10:00:17.801281**，较截止晚 **17.801281 秒**。下文时间均为北京时间，原始 UTC 精度见配套证据。库存是核验时点值，发布和入库按事件时间归期。

**五账号实际发布**

P1 @icyndizhang **3**；P2 @sailing_981 **3**；P3 @mydecorshop **3**；P4 @cindyzhang62 **3**；P5 @ivy5205 **2**。下列全部以数据库发布历史为准，用 Pin ID 去重，并关联审核队列和店铺商品。

|账号|真实发布时间|店铺 / Etsy 商品 ID|实际 Pin|
|---|---|---|---|
|P1|11-08 10:05:01|Parkermo [1857030803](https://www.etsy.com/listing/1857030803)|[801218590009713903](https://www.pinterest.com/pin/801218590009713903/)|
|P2|11-08 10:10:02|KoltCraftStudio [1762601419](https://www.etsy.com/listing/1762601419)|[863494928599502157](https://www.pinterest.com/pin/863494928599502157/)|
|P3|11-08 10:25:02|LoomGoStudio [4574789278](https://www.etsy.com/listing/4574789278)|[499618152434347792](https://www.pinterest.com/pin/499618152434347792/)|
|P4|11-08 10:35:02|PearlsTreasuresArt [1836826948](https://www.etsy.com/listing/1836826948)|[675399275414810571](https://www.pinterest.com/pin/675399275414810571/)|
|P1|11-08 21:00:04|ShirieHomeShow [1902114323](https://www.etsy.com/listing/1902114323)|[801218590009720305](https://www.pinterest.com/pin/801218590009720305/)|
|P2|11-08 21:05:02|WoodHomeLiang [1798165485](https://www.etsy.com/listing/1798165485)|[863494928599508032](https://www.pinterest.com/pin/863494928599508032/)|
|P3|11-08 21:25:02|Chtte [4586894685](https://www.etsy.com/listing/4586894685)|[499618152434350504](https://www.pinterest.com/pin/499618152434350504/)|
|P4|11-08 21:40:02|QuGifts [1882125442](https://www.etsy.com/listing/1882125442)|[675399275414816509](https://www.pinterest.com/pin/675399275414816509/)|
|P5|11-08 22:35:02|NinaJiaStudio [4415234134](https://www.etsy.com/listing/4415234134)|[713820609737862144](https://www.pinterest.com/pin/713820609737862144/)|
|P1|11-09 08:00:04|SobiaStudio [4363478666](https://www.etsy.com/listing/4363478666)|[801218590009729716](https://www.pinterest.com/pin/801218590009729716/)|
|P2|11-09 08:05:02|LambertHouse [1879279180](https://www.etsy.com/listing/1879279180)|[863494928599516522](https://www.pinterest.com/pin/863494928599516522/)|
|P3|11-09 08:25:02|CellaHo [4364672461](https://www.etsy.com/listing/4364672461)|[499618152434354655](https://www.pinterest.com/pin/499618152434354655/)|
|P4|11-09 08:30:02|ChicDecorHK [4356452486](https://www.etsy.com/listing/4356452486)|[675399275414825265](https://www.pinterest.com/pin/675399275414825265/)|
|P5|11-09 09:35:02|NngGoods [4538043388](https://www.etsy.com/listing/4538043388)|[713820609737871062](https://www.pinterest.com/pin/713820609737871062/)|

**实际补货入库**

下列 12 条在各批入库后独立 Verify 及本期新 Verify 中均为 `queue_status=ready`、`snapshot_matches=true`。商品来自登记 Etsy 店铺当前店面，排除已知 ID 后进入实际详情核验卖家、可选在售规格和可用 Add to cart，并查看主图截图。视觉栏为原核验时间及所见内容；[第一批](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261108-052405.json)与[第二批](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261108-171824.json)保存逐件原图 URL 和完整观察。

|店铺 / Etsy 商品 ID|账号|Board 名称 / ID|queue_id|实际入库|实际视觉核验与所见|
|---|---|---|---|---|---|
|Adamideal [4523363026](https://www.etsy.com/listing/4523363026/walnut-beech-wood-clamp-headphone-stand)|P2 @sailing_981|storage / 863494997243989843|a9019cfc-a18d-4127-a5ba-2231d482c9a3|11-08 13:25:54.858|11-08 13:24:05.570，木质耳机托架与黑色桌夹|
|CellaHo [4395693763](https://www.etsy.com/listing/4395693763/tencel-embroidered-fabric-chinese-style)|P3 @mydecorshop|Home Decor / 499618221101238533|f2193202-cb92-4992-a8c3-329d1982d90f|11-08 13:25:57.022|11-08 13:24:05.601，浅色薄纱上的亭台刺绣|
|KoltCraftStudio [1747883774](https://www.etsy.com/listing/1747883774/wooden-pants-hangers-adjustable-clip)|P2 @sailing_981|storage / 863494997243989843|631a2c63-417a-4fc1-bc05-28ed963ff66a|11-08 13:25:58.119|11-08 13:24:05.636，带金属夹的木裤架|
|LoomGoStudio [4574322861](https://www.etsy.com/listing/4574322861/silk-organza-jacquard-fabric-qilin-gold)|P3 @mydecorshop|Home Decor / 499618221101238533|d4493619-7e30-4de3-b474-0851db82361e|11-08 13:25:59.082|11-08 13:24:05.700，黄、青色提花薄纱|
|MiraKiuStudio [4385580248](https://www.etsy.com/listing/4385580248/beige-cotton-embroidered-lace-apron)|P1 @icyndizhang|CyndiZhangStudio / 801218658646993070|4e4a1b1f-6eb3-4510-a6f7-9d613a3500e2|11-08 13:26:01.072|11-08 13:24:05.754，米色荷叶边刺绣围裙|
|NngGoods [4392501130](https://www.etsy.com/listing/4392501130/natural-quartz-crystal-cabinet-knob-gold)|P5 @ivy5205|Furniture / 713820678377803412|4ed1be9f-c106-49f3-b8a1-144485bfb781|11-08 13:26:03.269|11-08 13:24:05.804，柜门金色拉手及粉色圆头|
|Parkermo [1856989877](https://www.etsy.com/listing/1856989877/blue-plaid-cafe-curtain-country-style)|P1 @icyndizhang|CyndiZhangStudio / 801218658646993070|3c2b699c-966c-4210-9961-aa300509790a|11-08 13:26:04.251|11-08 13:24:05.848，蓝白格纹咖啡帘|
|PearlsTreasuresArt [4397633965](https://www.etsy.com/listing/4397633965/seashell-necklace-natural-shell-pendant)|P4 @cindyzhang62|Jewelry & Accessories / 675399344058025061|2537e51c-0186-41f4-a67d-2aa8b2ca331a|11-08 13:26:06.328|11-08 13:24:05.910，编织篮旁的贝壳吊坠|
|ChicDecorHK [1267359860](https://www.etsy.com/listing/1267359860/golden-accent-ocean-seashell-conch-drop)|P4 @cindyzhang62|Jewelry & Accessories / 675399344058025061|aba37f26-49c7-4f96-9a80-89f04c7964dd|11-08 13:26:07.354|11-08 13:24:05.969，耳垂佩戴的海螺耳坠|
|QuGifts [4338887493](https://www.etsy.com/listing/4338887493/handmade-cowrie-shell-table-decor)|P4 @cindyzhang62|Decor / 675399344056772225|d1f07df4-8dec-4777-b8b3-1e63ee9d6520|11-09 01:20:01.107|11-09 01:18:23.631，黑底座上的两件贝壳环摆饰|
|ShirieHomeShow [1887210061](https://www.etsy.com/listing/1887210061/chenille-blackout-curtain-vintage-floral)|P1 @icyndizhang|CyndiZhangStudio / 801218658646993070|b1fbdddb-a671-40e6-9d1a-64f49a4afac7|11-09 01:20:04.896|11-09 01:18:23.795，蓝绿色花纹窗帘及选色卡|
|WoodHomeLiang [1677664863](https://www.etsy.com/listing/1677664863/beech-wood-suit-hangers-wide-shoulder)|P2 @sailing_981|storage / 863494997243989843|589a1795-ce5c-418a-908d-efe8564dd07d|11-09 01:20:09.957|11-09 01:18:24.125，衣柜内宽肩木衣架|

- [第一批入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/42450699774/job/128639152742)：首次 inserted=9、failed=0，实际重跑 inserted=0；[入库后 Verify](https://github.com/Sailin09/Store-Promotion/actions/runs/42450773848/job/128639314348)确认 9 条。
- [第二批入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/42504355837/job/128803763049)：首次 inserted=3、failed=0，实际重跑 inserted=0；[入库后 Verify](https://github.com/Sailin09/Store-Promotion/actions/runs/42504458059/job/128803972168)确认 3 条。
- 12 个 queue_id 和商品 ID 均唯一。两次实际重跑均未重复入库。本日报读取已有重跑日志，未重新执行补货。

**未入库候选**

[11 月 8 日 19:14 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261108-111253.json)及[11 月 9 日 07:15 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261108-231333.json)均没有合格新 ID；[11 月 9 日 01:17 检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261108-171512.json)只入库了上表第二批。Chtte 当时 13 款坐垫、HibiChStudio 符合既有挂袋分类的 8 款、NinaJiaStudio 在后两次所查的 24 款均为已知 ID。HibiChStudio 另外 13 款收纳箱、袋或衣罩不符合既有 Wall & Door Organizers 路线，单独排除：4454344966、4559057618、4559038359、4559062406、4559684799、4420844641、4473116090、4473114318、4420839477、4420842205、4517906376、4517885823、4454347860。以上均不计成功补货；未把店面筛查记作新品主图审核。

**核验时点各路线库存**

达标栏各店铺均为 **3 可用 / 0 缺口**；可用须为有效审核库存，草稿不计入。

|账号|可用 / 缺口合计|未达标路线（可用/缺口）|达标路线（各 3/0）|
|---|---|---|---|
|P1 @icyndizhang|52 / 2|Chtte 2/1、SobiaStudio 2/1|AmyHomeCrafts、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、StellaGoodsGifts、TunaMunStudio、WOGOL、beou|
|P2 @sailing_981|14 / 4|HibiChStudio 0/3、LambertHouse 2/1|Adamideal、KoltCraftStudio、MiawoodStudio、WoodHomeLiang|
|P3 @mydecorshop|5 / 4|Chtte 0/3、CellaHo 2/1|LoomGoStudio|
|P4 @cindyzhang62|8 / 1|ChicDecorHK 2/1|PearlsTreasuresArt、QuGifts|
|P5 @ivy5205|4 / 2|NinaJiaStudio 2/1、NngGoods 2/1||
|合计|83 / 13|按目标 3 计算|共 32 条有效路线|

现有库存 SQL 仍按目标 7 出数；本日报使用同一份新查询的 usable 按目标 3 重算缺口，未修改配置。Chtte P3 仍为 Kitchen & Dining / 499618221101215211，分类 Chair Cushions & Seat Pads；旧布料 4325858718 未复用。

**未发布、失败、修复与待处理**

- 五账号均启用且 OAuth 已连接。当前 83 条可用库存待既有调度；另外有草稿 85 条，其中有图 3 条（P1 55/0、P2 26/0、P3 4/3、P4 0/0、P5 0/0，分别为草稿/有图）。未来逐条发布时间未确认。现有调度每五分钟启用，发布窗口 08:00–11:00、21:00–23:00，账号最小间隔 2 小时，另有店铺限频。
- 本次数据库未见未完成或结果不确定的发布尝试，店铺覆盖查询未见 paused/failed。区间读取的 4 个 GitHub 发布 job 均为 `idle / outside_publish_window`、published=0；[最新发布 job](https://github.com/Sailin09/Store-Promotion/actions/runs/42536587861/job/128902120590)同样如此。这些空闲结果不计为发布，14 条均来自真实发布历史。
- [晚间报告 job](https://github.com/Sailin09/Store-Promotion/actions/runs/42510151694/job/128821356007)于 **11 月 9 日 02:28:47** 在报告步骤退出码 1，日志仅给通用失败提示，且无 artifact，根因未确认。[后续库存报告 job](https://github.com/Sailin09/Store-Promotion/actions/runs/42523915576/job/128863250677)成功更新 Issue #2，只证明库存报告可用；晚间报告修复或恢复未确认。区间 main 未见脚本或工作流修复提交，本日报未执行修复。
- 补货入库失败 0；13 条库存缺口仍待解决。首次缺口跟进状态仍为 [completed](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)，历史闭环未重开。现有发布、长期补货、库存报告及复核安排保持原样。

**截止后事件（不计入区间）**

截至 10:00:17 的新核验，未见截止后已落库的新增 Pin 或补货素材。请求 1011 于截止后 10:00:00.089204 完成，HTTP 200、idle；请求 1012 于同刻发起，核验时尚无完成时间或结果。两者均不计发布。

**覆盖与投递**

通过 GitHub 连接器读取最新 main、区间 2 个 batch、4 个 cloud-run、核验日志、首次跟进、云端运维说明及 Issue #2 的全部 97 条既有评论；按标题查到[历史发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)，已读取正文，评论 0 条。历史累计 62 条及 113/116 条库存不作区间基线。数据库发布历史查询无行数上限，时间范围覆盖整个日报区间；补货以两批实际 inserted 与 12 条数据库队列对账。调度日志仅最近 10 条 cron、20 条 HTTP，**全区间瞬时错误覆盖不完整**；现有查询不能独立证明所有未进入审核队列的写入，未见第三批入库证据。

[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-09.md) · [配套 JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-09.json)。本正文用于本云端任务聊天及 [Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 当日唯一日报评论；设备通知送达未独立核验。仅重跑只读 Verify 与写日报证据、评论和续接状态，未触发发布、补货、入队、修复或重置历史。