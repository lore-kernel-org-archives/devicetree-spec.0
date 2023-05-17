From: Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/5] of: reserved_mem: Provide more control about
 allocation behavior
Date: Wed, 17 May 2023 21:25:36 +0200
Message-ID: <c28494ec-1eb3-239e-46d8-fe84c2f28e77@linaro.org>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684351538; x=1686943538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ITJQ6BvmC/gprSSWzEVWg1Y3AF8tHDZkXSoXVabNDY=;
        b=BwI8NeIlYwTsmyAaTI9Z+PZIeJ/DkTmPHMHvfQlzEDIMMz0f0PDW8otXD8sMIBtMlA
         E7b3XWB/mlN9eN8GVd7I8Mjqf08OT6D26sABVWTbGMI61jIl4xc1y2h9Hh/WPfwIDqG0
         Mp/pj9+m34Yl/O+fbQ3Rj4mTnaa8Flo5KgEUo28+hvJfRVmdsxjhaFOHGkotVPB8TeHg
         IPao9GVsUKlJf+IwgXoqF/38HsfyJYik8h4Nna5oAvmlrDgmWZqHePw4tz0dASe/Q2yo
         80SXHRwZHIyc0AXkCty33fhXy/xP2fTohzUbyRuEbh8jPTc865XSSY3hL3BlbQ6P1suK
         d46A==
Content-Language: en-US
In-Reply-To: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 15.05.2023 12:12, Stephan Gerhold wrote:
> Provide more control about the allocation behavior for dynamically 
> allocated reserved memory by adding a "alloc-bottom-up" and 
> "alloc-top-down" option and by making the allocation order 
> deterministic.
> 
> The motivation for this patch series are the many different reserved 
> firmware regions on Qualcomm platforms. Currently it is often necessary 
> to duplicate them into each board DT, because minor differences for 
> some of the firmware regions (e.g. the firmware size) requires shifting
> the base address of all following firmware regions as well.
> 
> I propose describing the actual requirements (size, alignment, 
> alloc-ranges) instead and allocating the reserved regions at runtime. 
> This allows defining only the actual device-specific part in the board 
> DT and having everything else shared in the SoC.dtsi.
> 
> The series starts with two minor additions to the of_reserved_mem code. 
> The last two patches are examples that are meant to show the motivation
> more clearly for the MSM8916 SoC. PATCH 4/5 shows the current (static) 
> approach, then PATCH 5/5 switches to the dynamic allocation based on
> the first 3 patches.
> 
> If the first 3 patches are accepted I would send the full MSM8916 DT
> changes in a separate series.
> 
> Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
> ---
Sounds great!

Konrad
> Stephan Gerhold (5):
>       dt-bindings: reserved-memory: Add alloc-{bottom-up,top-down}
>       of: reserved_mem: Implement alloc-{bottom-up,top-down}
>       of: reserved_mem: Use stable allocation order
>       [RFC] arm64: dts: qcom: msm8916: Enable modem on two phones
>       [RFC] arm64: dts: qcom: msm8916: Reserve firmware memory dynamically
> 
>  .../bindings/reserved-memory/reserved-memory.yaml  | 39 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts           | 13 +++++++
>  .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 31 ++++++++++++++--
>  .../boot/dts/qcom/msm8916-samsung-serranove.dts    | 21 +++++++++++
>  arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          | 29 ++++++++-------
>  arch/arm64/boot/dts/qcom/msm8916.dtsi              | 42 ++++++++++++++++------
>  drivers/of/of_reserved_mem.c                       | 14 +++++++-
>  7 files changed, 163 insertions(+), 26 deletions(-)
> ---
> base-commit: 715abedee4cd660ad390659aefa7482f05275bbd
> change-id: 20230510-dt-resv-bottom-up-68d71ff6628f
> 
> Best regards,
