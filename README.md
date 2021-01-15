# E-Shop：简易电子商务系统

18373184 何林璇

### 功能描述

在这个系统中，每个用户可以是卖家，也可以是买家。

作为卖家，主要有两个界面，“我的店铺”和“我售出的”。

在“我的店铺”中，用户可以查看自己的店铺、店铺中的商品、以及商品的不同购买选项，还可以创建新的店铺，为一个店铺创建新的商品，或者为一个商品创建新的购买选项。在“我售出的”中，用户可以看到自己不同的店铺对应的出售商品的情况，包括商品名，金额，时间，购买者，购买者提供的地址电话等信息。

作为买家，有“商城”，“我的收藏夹”，“我的购物车”，“我的订单”这几个界面。

在“商城”中，用户可以查看除了自己店铺的商品以外的所有商品，查看商品的详细信息，以及将商品添加进收藏夹或者购物车。在“我的收藏夹”中，用户可以查看添加到收藏夹的所有商品及详细信息，还可以进入商城中的对应商品界面，并将商品添加到购物车中，此外还可以将商品移出收藏夹。在“我的购物车”界面，用户可以查看所有已经添加到购物车的商品选项及对应金额，已经购物车中所有物品的总金额，填写地址和电话后，点击支付即可提交该订单。在“我的订单”界面，用户可以查看所有生成的订单以及详细信息。

### 实体及其关系

设计表格：

| 实体名                    | 属性                                                     | 外键                                 |
| ------------------------- | -------------------------------------------------------- | ------------------------------------ |
| User                      | email : string, Password : string                        |                                      |
| Product                   | Name : string, Description : string, graph_link : string | shop_id                              |
| Product_option            | Description : string, price: float                       | product_id                           |
| Cart                      |                                                          | user_id, product_option_id           |
| Favorite                  |                                                          | user_id, product_id                  |
| My_transaction            | address: string, phone: string                           | user_id                              |
| Transaction_product_table |                                                          | my_transaction_id, product_option_id |
| Shop                      | Name: string, Description : string                       | user_id                              |
| Sold                      | address: string, phone: string, amount: float            | user_id, product_option_id           |

ER图如下：

![image-20210114170214917](/home/h/.config/Typora/typora-user-images/image-20210114170214917.png)



### 相关配置

ruby版本：2.5.1