From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: reserved-memory: Refine 'size' and
 'alignment' types
Date: Tue, 31 Jan 2023 17:40:40 -0600
Message-ID: <167520843972.2162817.14937783775593918446.robh@kernel.org>
References: <20230125221450.3058762-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20230125221450.3058762-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


On Wed, 25 Jan 2023 16:14:50 -0600, Rob Herring wrote:
> Both 'size' and 'alignment' are single values, but can be 32 or 64 bits.
> Use the precise types rather than the 2 32-bit cell encoding.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/reserved-memory/reserved-memory.yaml    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Applied, thanks!

