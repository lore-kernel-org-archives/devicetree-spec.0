From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 2/2] of: reserved_mem: Use stable allocation order
Date: Wed, 14 Jun 2023 21:20:43 +0200
Message-ID: <20230510-dt-resv-bottom-up-v2-2-aeb2afc8ac25@gerhold.net>
References: <20230510-dt-resv-bottom-up-v2-0-aeb2afc8ac25@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686770450;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=UluM9+M229bqxNKRVyMbYxl7B1w1kAZMQitydXUBD28=;
    b=g7syv8W2y35nAZX50kYrrm3tfoG++XJKz8f5p/rigy3BltRtK4vL5TMuYszF1dwtse
    RufMsgIOEic/qkcj6bnu/5hJXDfChbQ1YUtMoyNbp5ZbOGjpxd9OkZtet9ivIrGu06eb
    FAx4KHKGXyBQu369DaIsfZlL1KsfTSfwpA9+UktwehWNVeMpZgOTCEqi4fEyz3yF90gF
    mn9vzsuG8Lo03aO7gBQTBYwvHyKOqF7znjlsZXi4dMnHw6dLt5YODu/4Ud3sU031qvFM
    noCiVSW28yZqX/KCbbRKSsYpRfBFcf6wrhB72V2IzBcJFU23AHCT/BNL9KnsEFcQuyrq
    JBdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686770450;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=UluM9+M229bqxNKRVyMbYxl7B1w1kAZMQitydXUBD28=;
    b=uujPduChBqw6UvhU+5eAOYzjNxBJui7UDaUDKg+a75Nab4ET2EAVTkP7v98EF9QCQf
    hOP/8HcWMipJCyuAnwCw==
In-Reply-To: <20230510-dt-resv-bottom-up-v2-0-aeb2afc8ac25@gerhold.net>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>

sort() in Linux is based on heapsort which is not a stable sort
algorithm - equal elements are being reordered. For reserved memory in
the device tree this happens mainly for dynamic allocations: They do not
have an address to sort with, so they are reordered somewhat randomly
when adding/removing other unrelated reserved memory nodes.

Functionally this is not a big problem, but it's confusing during
development when all the addresses change after adding unrelated
reserved memory nodes.

Make the order stable by sorting dynamic allocations according to
the node order in the device tree. Static allocations are not affected
by this because they are still sorted by their (fixed) address.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/of/of_reserved_mem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7f892c3dcc63..7ec94cfcbddb 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -268,6 +268,11 @@ static int __init __rmem_cmp(const void *a, const void *b)
 	if (ra->size > rb->size)
 		return 1;
 
+	if (ra->fdt_node < rb->fdt_node)
+		return -1;
+	if (ra->fdt_node > rb->fdt_node)
+		return 1;
+
 	return 0;
 }
 

-- 
2.40.1

