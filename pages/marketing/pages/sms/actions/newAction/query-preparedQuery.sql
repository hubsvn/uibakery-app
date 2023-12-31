SELECT trigger_event.*,flow_run.status FROM public.trigger_event
LEFT JOIN public.flow_run on flow_run.created = trigger_event.created