From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] of: reserved_mem: Use stable allocation order
Date: Tue, 20 Jun 2023 09:35:00 -0600
Message-ID: <168727529919.3637328.11452341509705803196.robh@kernel.org>
References: <20230510-dt-resv-bottom-up-v2-0-aeb2afc8ac25@gerhold.net>
 <20230510-dt-resv-bottom-up-v2-2-aeb2afc8ac25@gerhold.net>
Mime-Version: 1.0
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20230510-dt-resv-bottom-up-v2-2-aeb2afc8ac25@gerhold.net>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>


On Wed, 14 Jun 2023 21:20:43 +0200, Stephan Gerhold wrote:
> sort() in Linux is based on heapsort which is not a stable sort
> algorithm - equal elements are being reordered. For reserved memory in
> the device tree this happens mainly for dynamic allocations: They do not
> have an address to sort with, so they are reordered somewhat randomly
> when adding/removing other unrelated reserved memory nodes.
> 
> Functionally this is not a big problem, but it's confusing during
> development when all the addresses change after adding unrelated
> reserved memory nodes.
> 
> Make the order stable by sorting dynamic allocations according to
> the node order in the device tree. Static allocations are not affected
> by this because they are still sorted by their (fixed) address.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/of/of_reserved_mem.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Applied, thanks!

